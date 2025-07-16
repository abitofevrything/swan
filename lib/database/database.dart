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
  int get schemaVersion => 2;

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
}
