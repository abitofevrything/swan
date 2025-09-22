// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GuildConfigurationsTable extends GuildConfigurations
    with TableInfo<$GuildConfigurationsTable, GuildConfiguration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuildConfigurationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _guildIdMeta = const VerificationMeta(
    'guildId',
  );
  @override
  late final GeneratedColumn<int> guildId = GeneratedColumn<int>(
    'guild_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _warningChannelIdMeta = const VerificationMeta(
    'warningChannelId',
  );
  @override
  late final GeneratedColumn<int> warningChannelId = GeneratedColumn<int>(
    'warning_channel_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rulesChannelIdMeta = const VerificationMeta(
    'rulesChannelId',
  );
  @override
  late final GeneratedColumn<int> rulesChannelId = GeneratedColumn<int>(
    'rules_channel_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sendMultipleWarningsMeta =
      const VerificationMeta('sendMultipleWarnings');
  @override
  late final GeneratedColumn<bool> sendMultipleWarnings = GeneratedColumn<bool>(
    'send_multiple_warnings',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("send_multiple_warnings" IN (0, 1))',
    ),
    defaultValue: Constant(true),
  );
  static const VerificationMeta _spamLimitMeta = const VerificationMeta(
    'spamLimit',
  );
  @override
  late final GeneratedColumn<int> spamLimit = GeneratedColumn<int>(
    'spam_limit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(5),
  );
  @override
  List<GeneratedColumn> get $columns => [
    guildId,
    warningChannelId,
    rulesChannelId,
    sendMultipleWarnings,
    spamLimit,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guild_configurations';
  @override
  VerificationContext validateIntegrity(
    Insertable<GuildConfiguration> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guild_id')) {
      context.handle(
        _guildIdMeta,
        guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta),
      );
    }
    if (data.containsKey('warning_channel_id')) {
      context.handle(
        _warningChannelIdMeta,
        warningChannelId.isAcceptableOrUnknown(
          data['warning_channel_id']!,
          _warningChannelIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warningChannelIdMeta);
    }
    if (data.containsKey('rules_channel_id')) {
      context.handle(
        _rulesChannelIdMeta,
        rulesChannelId.isAcceptableOrUnknown(
          data['rules_channel_id']!,
          _rulesChannelIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rulesChannelIdMeta);
    }
    if (data.containsKey('send_multiple_warnings')) {
      context.handle(
        _sendMultipleWarningsMeta,
        sendMultipleWarnings.isAcceptableOrUnknown(
          data['send_multiple_warnings']!,
          _sendMultipleWarningsMeta,
        ),
      );
    }
    if (data.containsKey('spam_limit')) {
      context.handle(
        _spamLimitMeta,
        spamLimit.isAcceptableOrUnknown(data['spam_limit']!, _spamLimitMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guildId};
  @override
  GuildConfiguration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuildConfiguration(
      guildId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guild_id'],
      )!,
      warningChannelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warning_channel_id'],
      )!,
      rulesChannelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rules_channel_id'],
      )!,
      sendMultipleWarnings: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}send_multiple_warnings'],
      )!,
      spamLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}spam_limit'],
      )!,
    );
  }

  @override
  $GuildConfigurationsTable createAlias(String alias) {
    return $GuildConfigurationsTable(attachedDatabase, alias);
  }
}

class GuildConfiguration extends DataClass
    implements Insertable<GuildConfiguration> {
  final int guildId;
  final int warningChannelId;
  final int rulesChannelId;
  final bool sendMultipleWarnings;
  final int spamLimit;
  const GuildConfiguration({
    required this.guildId,
    required this.warningChannelId,
    required this.rulesChannelId,
    required this.sendMultipleWarnings,
    required this.spamLimit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guild_id'] = Variable<int>(guildId);
    map['warning_channel_id'] = Variable<int>(warningChannelId);
    map['rules_channel_id'] = Variable<int>(rulesChannelId);
    map['send_multiple_warnings'] = Variable<bool>(sendMultipleWarnings);
    map['spam_limit'] = Variable<int>(spamLimit);
    return map;
  }

  GuildConfigurationsCompanion toCompanion(bool nullToAbsent) {
    return GuildConfigurationsCompanion(
      guildId: Value(guildId),
      warningChannelId: Value(warningChannelId),
      rulesChannelId: Value(rulesChannelId),
      sendMultipleWarnings: Value(sendMultipleWarnings),
      spamLimit: Value(spamLimit),
    );
  }

  factory GuildConfiguration.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuildConfiguration(
      guildId: serializer.fromJson<int>(json['guildId']),
      warningChannelId: serializer.fromJson<int>(json['warningChannelId']),
      rulesChannelId: serializer.fromJson<int>(json['rulesChannelId']),
      sendMultipleWarnings: serializer.fromJson<bool>(
        json['sendMultipleWarnings'],
      ),
      spamLimit: serializer.fromJson<int>(json['spamLimit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guildId': serializer.toJson<int>(guildId),
      'warningChannelId': serializer.toJson<int>(warningChannelId),
      'rulesChannelId': serializer.toJson<int>(rulesChannelId),
      'sendMultipleWarnings': serializer.toJson<bool>(sendMultipleWarnings),
      'spamLimit': serializer.toJson<int>(spamLimit),
    };
  }

  GuildConfiguration copyWith({
    int? guildId,
    int? warningChannelId,
    int? rulesChannelId,
    bool? sendMultipleWarnings,
    int? spamLimit,
  }) => GuildConfiguration(
    guildId: guildId ?? this.guildId,
    warningChannelId: warningChannelId ?? this.warningChannelId,
    rulesChannelId: rulesChannelId ?? this.rulesChannelId,
    sendMultipleWarnings: sendMultipleWarnings ?? this.sendMultipleWarnings,
    spamLimit: spamLimit ?? this.spamLimit,
  );
  GuildConfiguration copyWithCompanion(GuildConfigurationsCompanion data) {
    return GuildConfiguration(
      guildId: data.guildId.present ? data.guildId.value : this.guildId,
      warningChannelId: data.warningChannelId.present
          ? data.warningChannelId.value
          : this.warningChannelId,
      rulesChannelId: data.rulesChannelId.present
          ? data.rulesChannelId.value
          : this.rulesChannelId,
      sendMultipleWarnings: data.sendMultipleWarnings.present
          ? data.sendMultipleWarnings.value
          : this.sendMultipleWarnings,
      spamLimit: data.spamLimit.present ? data.spamLimit.value : this.spamLimit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuildConfiguration(')
          ..write('guildId: $guildId, ')
          ..write('warningChannelId: $warningChannelId, ')
          ..write('rulesChannelId: $rulesChannelId, ')
          ..write('sendMultipleWarnings: $sendMultipleWarnings, ')
          ..write('spamLimit: $spamLimit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    guildId,
    warningChannelId,
    rulesChannelId,
    sendMultipleWarnings,
    spamLimit,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuildConfiguration &&
          other.guildId == this.guildId &&
          other.warningChannelId == this.warningChannelId &&
          other.rulesChannelId == this.rulesChannelId &&
          other.sendMultipleWarnings == this.sendMultipleWarnings &&
          other.spamLimit == this.spamLimit);
}

class GuildConfigurationsCompanion extends UpdateCompanion<GuildConfiguration> {
  final Value<int> guildId;
  final Value<int> warningChannelId;
  final Value<int> rulesChannelId;
  final Value<bool> sendMultipleWarnings;
  final Value<int> spamLimit;
  const GuildConfigurationsCompanion({
    this.guildId = const Value.absent(),
    this.warningChannelId = const Value.absent(),
    this.rulesChannelId = const Value.absent(),
    this.sendMultipleWarnings = const Value.absent(),
    this.spamLimit = const Value.absent(),
  });
  GuildConfigurationsCompanion.insert({
    this.guildId = const Value.absent(),
    required int warningChannelId,
    required int rulesChannelId,
    this.sendMultipleWarnings = const Value.absent(),
    this.spamLimit = const Value.absent(),
  }) : warningChannelId = Value(warningChannelId),
       rulesChannelId = Value(rulesChannelId);
  static Insertable<GuildConfiguration> custom({
    Expression<int>? guildId,
    Expression<int>? warningChannelId,
    Expression<int>? rulesChannelId,
    Expression<bool>? sendMultipleWarnings,
    Expression<int>? spamLimit,
  }) {
    return RawValuesInsertable({
      if (guildId != null) 'guild_id': guildId,
      if (warningChannelId != null) 'warning_channel_id': warningChannelId,
      if (rulesChannelId != null) 'rules_channel_id': rulesChannelId,
      if (sendMultipleWarnings != null)
        'send_multiple_warnings': sendMultipleWarnings,
      if (spamLimit != null) 'spam_limit': spamLimit,
    });
  }

  GuildConfigurationsCompanion copyWith({
    Value<int>? guildId,
    Value<int>? warningChannelId,
    Value<int>? rulesChannelId,
    Value<bool>? sendMultipleWarnings,
    Value<int>? spamLimit,
  }) {
    return GuildConfigurationsCompanion(
      guildId: guildId ?? this.guildId,
      warningChannelId: warningChannelId ?? this.warningChannelId,
      rulesChannelId: rulesChannelId ?? this.rulesChannelId,
      sendMultipleWarnings: sendMultipleWarnings ?? this.sendMultipleWarnings,
      spamLimit: spamLimit ?? this.spamLimit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guildId.present) {
      map['guild_id'] = Variable<int>(guildId.value);
    }
    if (warningChannelId.present) {
      map['warning_channel_id'] = Variable<int>(warningChannelId.value);
    }
    if (rulesChannelId.present) {
      map['rules_channel_id'] = Variable<int>(rulesChannelId.value);
    }
    if (sendMultipleWarnings.present) {
      map['send_multiple_warnings'] = Variable<bool>(
        sendMultipleWarnings.value,
      );
    }
    if (spamLimit.present) {
      map['spam_limit'] = Variable<int>(spamLimit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuildConfigurationsCompanion(')
          ..write('guildId: $guildId, ')
          ..write('warningChannelId: $warningChannelId, ')
          ..write('rulesChannelId: $rulesChannelId, ')
          ..write('sendMultipleWarnings: $sendMultipleWarnings, ')
          ..write('spamLimit: $spamLimit')
          ..write(')'))
        .toString();
  }
}

abstract class _$SwanDatabase extends GeneratedDatabase {
  _$SwanDatabase(QueryExecutor e) : super(e);
  $SwanDatabaseManager get managers => $SwanDatabaseManager(this);
  late final $GuildConfigurationsTable guildConfigurations =
      $GuildConfigurationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [guildConfigurations];
}

typedef $$GuildConfigurationsTableCreateCompanionBuilder =
    GuildConfigurationsCompanion Function({
      Value<int> guildId,
      required int warningChannelId,
      required int rulesChannelId,
      Value<bool> sendMultipleWarnings,
      Value<int> spamLimit,
    });
typedef $$GuildConfigurationsTableUpdateCompanionBuilder =
    GuildConfigurationsCompanion Function({
      Value<int> guildId,
      Value<int> warningChannelId,
      Value<int> rulesChannelId,
      Value<bool> sendMultipleWarnings,
      Value<int> spamLimit,
    });

class $$GuildConfigurationsTableFilterComposer
    extends Composer<_$SwanDatabase, $GuildConfigurationsTable> {
  $$GuildConfigurationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get guildId => $composableBuilder(
    column: $table.guildId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get warningChannelId => $composableBuilder(
    column: $table.warningChannelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rulesChannelId => $composableBuilder(
    column: $table.rulesChannelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sendMultipleWarnings => $composableBuilder(
    column: $table.sendMultipleWarnings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spamLimit => $composableBuilder(
    column: $table.spamLimit,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GuildConfigurationsTableOrderingComposer
    extends Composer<_$SwanDatabase, $GuildConfigurationsTable> {
  $$GuildConfigurationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get guildId => $composableBuilder(
    column: $table.guildId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get warningChannelId => $composableBuilder(
    column: $table.warningChannelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rulesChannelId => $composableBuilder(
    column: $table.rulesChannelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sendMultipleWarnings => $composableBuilder(
    column: $table.sendMultipleWarnings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spamLimit => $composableBuilder(
    column: $table.spamLimit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GuildConfigurationsTableAnnotationComposer
    extends Composer<_$SwanDatabase, $GuildConfigurationsTable> {
  $$GuildConfigurationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get guildId =>
      $composableBuilder(column: $table.guildId, builder: (column) => column);

  GeneratedColumn<int> get warningChannelId => $composableBuilder(
    column: $table.warningChannelId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rulesChannelId => $composableBuilder(
    column: $table.rulesChannelId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sendMultipleWarnings => $composableBuilder(
    column: $table.sendMultipleWarnings,
    builder: (column) => column,
  );

  GeneratedColumn<int> get spamLimit =>
      $composableBuilder(column: $table.spamLimit, builder: (column) => column);
}

class $$GuildConfigurationsTableTableManager
    extends
        RootTableManager<
          _$SwanDatabase,
          $GuildConfigurationsTable,
          GuildConfiguration,
          $$GuildConfigurationsTableFilterComposer,
          $$GuildConfigurationsTableOrderingComposer,
          $$GuildConfigurationsTableAnnotationComposer,
          $$GuildConfigurationsTableCreateCompanionBuilder,
          $$GuildConfigurationsTableUpdateCompanionBuilder,
          (
            GuildConfiguration,
            BaseReferences<
              _$SwanDatabase,
              $GuildConfigurationsTable,
              GuildConfiguration
            >,
          ),
          GuildConfiguration,
          PrefetchHooks Function()
        > {
  $$GuildConfigurationsTableTableManager(
    _$SwanDatabase db,
    $GuildConfigurationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuildConfigurationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuildConfigurationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$GuildConfigurationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> guildId = const Value.absent(),
                Value<int> warningChannelId = const Value.absent(),
                Value<int> rulesChannelId = const Value.absent(),
                Value<bool> sendMultipleWarnings = const Value.absent(),
                Value<int> spamLimit = const Value.absent(),
              }) => GuildConfigurationsCompanion(
                guildId: guildId,
                warningChannelId: warningChannelId,
                rulesChannelId: rulesChannelId,
                sendMultipleWarnings: sendMultipleWarnings,
                spamLimit: spamLimit,
              ),
          createCompanionCallback:
              ({
                Value<int> guildId = const Value.absent(),
                required int warningChannelId,
                required int rulesChannelId,
                Value<bool> sendMultipleWarnings = const Value.absent(),
                Value<int> spamLimit = const Value.absent(),
              }) => GuildConfigurationsCompanion.insert(
                guildId: guildId,
                warningChannelId: warningChannelId,
                rulesChannelId: rulesChannelId,
                sendMultipleWarnings: sendMultipleWarnings,
                spamLimit: spamLimit,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GuildConfigurationsTableProcessedTableManager =
    ProcessedTableManager<
      _$SwanDatabase,
      $GuildConfigurationsTable,
      GuildConfiguration,
      $$GuildConfigurationsTableFilterComposer,
      $$GuildConfigurationsTableOrderingComposer,
      $$GuildConfigurationsTableAnnotationComposer,
      $$GuildConfigurationsTableCreateCompanionBuilder,
      $$GuildConfigurationsTableUpdateCompanionBuilder,
      (
        GuildConfiguration,
        BaseReferences<
          _$SwanDatabase,
          $GuildConfigurationsTable,
          GuildConfiguration
        >,
      ),
      GuildConfiguration,
      PrefetchHooks Function()
    >;

class $SwanDatabaseManager {
  final _$SwanDatabase _db;
  $SwanDatabaseManager(this._db);
  $$GuildConfigurationsTableTableManager get guildConfigurations =>
      $$GuildConfigurationsTableTableManager(_db, _db.guildConfigurations);
}
