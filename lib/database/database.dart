import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

@DriftDatabase(tables: [GuildConfigurations])
class SwanDatabase extends _$SwanDatabase {
  static const databaseLocation = 'config/database.sqlite3';

  SwanDatabase()
    : super(NativeDatabase.createInBackground(File(databaseLocation)));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 3) {
        await m.addColumn(
          guildConfigurations,
          guildConfigurations.sendMultipleWarnings,
        );
        await m.addColumn(guildConfigurations, guildConfigurations.spamLimit);
      }
    },
  );

  Future<GuildConfiguration?> antiSpamConfig(int id) => (select(
    guildConfigurations,
  )..where((tbl) => tbl.guildId.equals(id))).getSingleOrNull();

  Future<void> setAntiSpamConfig(GuildConfigurationsCompanion config) =>
      into(guildConfigurations).insertOnConflictUpdate(config);

  Future<void> deleteAntiSpamConfig(int id) => (delete(
    guildConfigurations,
  )..where((tbl) => tbl.guildId.equals(id))).go();
}

class GuildConfigurations extends Table {
  @override
  Set<Column> get primaryKey => {guildId};

  IntColumn get guildId => integer()();
  IntColumn get warningChannelId => integer()();
  IntColumn get rulesChannelId => integer()();
  BoolColumn get sendMultipleWarnings =>
      boolean().withDefault(Constant(true))();
  IntColumn get spamLimit => integer().withDefault(Constant(5))();
}
