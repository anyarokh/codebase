// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $WordItemsTable extends WordItems with TableInfo<$WordItemsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPrMeta = const VerificationMeta('idPr');
  @override
  late final GeneratedColumn<int> idPr = GeneratedColumn<int>(
      'id_pr', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _basic_wordMeta =
      const VerificationMeta('basic_word');
  @override
  late final GeneratedColumn<String> basic_word = GeneratedColumn<String>(
      'basic_word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _split_wordMeta =
      const VerificationMeta('split_word');
  @override
  late final GeneratedColumn<String> split_word = GeneratedColumn<String>(
      'split_word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idPr, id, basic_word, split_word];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_items';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_pr')) {
      context.handle(
          _idPrMeta, idPr.isAcceptableOrUnknown(data['id_pr']!, _idPrMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('basic_word')) {
      context.handle(
          _basic_wordMeta,
          basic_word.isAcceptableOrUnknown(
              data['basic_word']!, _basic_wordMeta));
    } else if (isInserting) {
      context.missing(_basic_wordMeta);
    }
    if (data.containsKey('split_word')) {
      context.handle(
          _split_wordMeta,
          split_word.isAcceptableOrUnknown(
              data['split_word']!, _split_wordMeta));
    } else if (isInserting) {
      context.missing(_split_wordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPr};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      idPr: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_pr'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      basic_word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}basic_word'])!,
      split_word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}split_word'])!,
    );
  }

  @override
  $WordItemsTable createAlias(String alias) {
    return $WordItemsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int idPr;
  final int id;
  final String basic_word;
  final String split_word;
  const Word(
      {required this.idPr,
      required this.id,
      required this.basic_word,
      required this.split_word});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_pr'] = Variable<int>(idPr);
    map['id'] = Variable<int>(id);
    map['basic_word'] = Variable<String>(basic_word);
    map['split_word'] = Variable<String>(split_word);
    return map;
  }

  WordItemsCompanion toCompanion(bool nullToAbsent) {
    return WordItemsCompanion(
      idPr: Value(idPr),
      id: Value(id),
      basic_word: Value(basic_word),
      split_word: Value(split_word),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      idPr: serializer.fromJson<int>(json['idPr']),
      id: serializer.fromJson<int>(json['id']),
      basic_word: serializer.fromJson<String>(json['basic_word']),
      split_word: serializer.fromJson<String>(json['split_word']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPr': serializer.toJson<int>(idPr),
      'id': serializer.toJson<int>(id),
      'basic_word': serializer.toJson<String>(basic_word),
      'split_word': serializer.toJson<String>(split_word),
    };
  }

  Word copyWith({int? idPr, int? id, String? basic_word, String? split_word}) =>
      Word(
        idPr: idPr ?? this.idPr,
        id: id ?? this.id,
        basic_word: basic_word ?? this.basic_word,
        split_word: split_word ?? this.split_word,
      );
  Word copyWithCompanion(WordItemsCompanion data) {
    return Word(
      idPr: data.idPr.present ? data.idPr.value : this.idPr,
      id: data.id.present ? data.id.value : this.id,
      basic_word:
          data.basic_word.present ? data.basic_word.value : this.basic_word,
      split_word:
          data.split_word.present ? data.split_word.value : this.split_word,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('idPr: $idPr, ')
          ..write('id: $id, ')
          ..write('basic_word: $basic_word, ')
          ..write('split_word: $split_word')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPr, id, basic_word, split_word);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.idPr == this.idPr &&
          other.id == this.id &&
          other.basic_word == this.basic_word &&
          other.split_word == this.split_word);
}

class WordItemsCompanion extends UpdateCompanion<Word> {
  final Value<int> idPr;
  final Value<int> id;
  final Value<String> basic_word;
  final Value<String> split_word;
  const WordItemsCompanion({
    this.idPr = const Value.absent(),
    this.id = const Value.absent(),
    this.basic_word = const Value.absent(),
    this.split_word = const Value.absent(),
  });
  WordItemsCompanion.insert({
    this.idPr = const Value.absent(),
    required int id,
    required String basic_word,
    required String split_word,
  })  : id = Value(id),
        basic_word = Value(basic_word),
        split_word = Value(split_word);
  static Insertable<Word> custom({
    Expression<int>? idPr,
    Expression<int>? id,
    Expression<String>? basic_word,
    Expression<String>? split_word,
  }) {
    return RawValuesInsertable({
      if (idPr != null) 'id_pr': idPr,
      if (id != null) 'id': id,
      if (basic_word != null) 'basic_word': basic_word,
      if (split_word != null) 'split_word': split_word,
    });
  }

  WordItemsCompanion copyWith(
      {Value<int>? idPr,
      Value<int>? id,
      Value<String>? basic_word,
      Value<String>? split_word}) {
    return WordItemsCompanion(
      idPr: idPr ?? this.idPr,
      id: id ?? this.id,
      basic_word: basic_word ?? this.basic_word,
      split_word: split_word ?? this.split_word,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPr.present) {
      map['id_pr'] = Variable<int>(idPr.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (basic_word.present) {
      map['basic_word'] = Variable<String>(basic_word.value);
    }
    if (split_word.present) {
      map['split_word'] = Variable<String>(split_word.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordItemsCompanion(')
          ..write('idPr: $idPr, ')
          ..write('id: $id, ')
          ..write('basic_word: $basic_word, ')
          ..write('split_word: $split_word')
          ..write(')'))
        .toString();
  }
}

class $AlternationItemsTable extends AlternationItems
    with TableInfo<$AlternationItemsTable, Alternation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlternationItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPrMeta = const VerificationMeta('idPr');
  @override
  late final GeneratedColumn<int> idPr = GeneratedColumn<int>(
      'id_pr', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<int> wordId = GeneratedColumn<int>(
      'word_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _morphology_processMeta =
      const VerificationMeta('morphology_process');
  @override
  late final GeneratedColumn<String> morphology_process =
      GeneratedColumn<String>('morphology_process', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _meaningMeta =
      const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idPr, id, wordId, morphology_process, explanation, meaning];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alternation_items';
  @override
  VerificationContext validateIntegrity(Insertable<Alternation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_pr')) {
      context.handle(
          _idPrMeta, idPr.isAcceptableOrUnknown(data['id_pr']!, _idPrMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word_id')) {
      context.handle(_wordIdMeta,
          wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta));
    } else if (isInserting) {
      context.missing(_wordIdMeta);
    }
    if (data.containsKey('morphology_process')) {
      context.handle(
          _morphology_processMeta,
          morphology_process.isAcceptableOrUnknown(
              data['morphology_process']!, _morphology_processMeta));
    } else if (isInserting) {
      context.missing(_morphology_processMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPr};
  @override
  Alternation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alternation(
      idPr: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_pr'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      wordId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word_id'])!,
      morphology_process: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}morphology_process'])!,
      explanation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}explanation'])!,
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning'])!,
    );
  }

  @override
  $AlternationItemsTable createAlias(String alias) {
    return $AlternationItemsTable(attachedDatabase, alias);
  }
}

class Alternation extends DataClass implements Insertable<Alternation> {
  final int idPr;
  final int id;
  final int wordId;
  final String morphology_process;
  final String explanation;
  final String meaning;
  const Alternation(
      {required this.idPr,
      required this.id,
      required this.wordId,
      required this.morphology_process,
      required this.explanation,
      required this.meaning});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_pr'] = Variable<int>(idPr);
    map['id'] = Variable<int>(id);
    map['word_id'] = Variable<int>(wordId);
    map['morphology_process'] = Variable<String>(morphology_process);
    map['explanation'] = Variable<String>(explanation);
    map['meaning'] = Variable<String>(meaning);
    return map;
  }

  AlternationItemsCompanion toCompanion(bool nullToAbsent) {
    return AlternationItemsCompanion(
      idPr: Value(idPr),
      id: Value(id),
      wordId: Value(wordId),
      morphology_process: Value(morphology_process),
      explanation: Value(explanation),
      meaning: Value(meaning),
    );
  }

  factory Alternation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alternation(
      idPr: serializer.fromJson<int>(json['idPr']),
      id: serializer.fromJson<int>(json['id']),
      wordId: serializer.fromJson<int>(json['wordId']),
      morphology_process:
          serializer.fromJson<String>(json['morphology_process']),
      explanation: serializer.fromJson<String>(json['explanation']),
      meaning: serializer.fromJson<String>(json['meaning']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPr': serializer.toJson<int>(idPr),
      'id': serializer.toJson<int>(id),
      'wordId': serializer.toJson<int>(wordId),
      'morphology_process': serializer.toJson<String>(morphology_process),
      'explanation': serializer.toJson<String>(explanation),
      'meaning': serializer.toJson<String>(meaning),
    };
  }

  Alternation copyWith(
          {int? idPr,
          int? id,
          int? wordId,
          String? morphology_process,
          String? explanation,
          String? meaning}) =>
      Alternation(
        idPr: idPr ?? this.idPr,
        id: id ?? this.id,
        wordId: wordId ?? this.wordId,
        morphology_process: morphology_process ?? this.morphology_process,
        explanation: explanation ?? this.explanation,
        meaning: meaning ?? this.meaning,
      );
  Alternation copyWithCompanion(AlternationItemsCompanion data) {
    return Alternation(
      idPr: data.idPr.present ? data.idPr.value : this.idPr,
      id: data.id.present ? data.id.value : this.id,
      wordId: data.wordId.present ? data.wordId.value : this.wordId,
      morphology_process: data.morphology_process.present
          ? data.morphology_process.value
          : this.morphology_process,
      explanation:
          data.explanation.present ? data.explanation.value : this.explanation,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Alternation(')
          ..write('idPr: $idPr, ')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('morphology_process: $morphology_process, ')
          ..write('explanation: $explanation, ')
          ..write('meaning: $meaning')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idPr, id, wordId, morphology_process, explanation, meaning);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alternation &&
          other.idPr == this.idPr &&
          other.id == this.id &&
          other.wordId == this.wordId &&
          other.morphology_process == this.morphology_process &&
          other.explanation == this.explanation &&
          other.meaning == this.meaning);
}

class AlternationItemsCompanion extends UpdateCompanion<Alternation> {
  final Value<int> idPr;
  final Value<int> id;
  final Value<int> wordId;
  final Value<String> morphology_process;
  final Value<String> explanation;
  final Value<String> meaning;
  const AlternationItemsCompanion({
    this.idPr = const Value.absent(),
    this.id = const Value.absent(),
    this.wordId = const Value.absent(),
    this.morphology_process = const Value.absent(),
    this.explanation = const Value.absent(),
    this.meaning = const Value.absent(),
  });
  AlternationItemsCompanion.insert({
    this.idPr = const Value.absent(),
    required int id,
    required int wordId,
    required String morphology_process,
    required String explanation,
    required String meaning,
  })  : id = Value(id),
        wordId = Value(wordId),
        morphology_process = Value(morphology_process),
        explanation = Value(explanation),
        meaning = Value(meaning);
  static Insertable<Alternation> custom({
    Expression<int>? idPr,
    Expression<int>? id,
    Expression<int>? wordId,
    Expression<String>? morphology_process,
    Expression<String>? explanation,
    Expression<String>? meaning,
  }) {
    return RawValuesInsertable({
      if (idPr != null) 'id_pr': idPr,
      if (id != null) 'id': id,
      if (wordId != null) 'word_id': wordId,
      if (morphology_process != null) 'morphology_process': morphology_process,
      if (explanation != null) 'explanation': explanation,
      if (meaning != null) 'meaning': meaning,
    });
  }

  AlternationItemsCompanion copyWith(
      {Value<int>? idPr,
      Value<int>? id,
      Value<int>? wordId,
      Value<String>? morphology_process,
      Value<String>? explanation,
      Value<String>? meaning}) {
    return AlternationItemsCompanion(
      idPr: idPr ?? this.idPr,
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      morphology_process: morphology_process ?? this.morphology_process,
      explanation: explanation ?? this.explanation,
      meaning: meaning ?? this.meaning,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPr.present) {
      map['id_pr'] = Variable<int>(idPr.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wordId.present) {
      map['word_id'] = Variable<int>(wordId.value);
    }
    if (morphology_process.present) {
      map['morphology_process'] = Variable<String>(morphology_process.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlternationItemsCompanion(')
          ..write('idPr: $idPr, ')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('morphology_process: $morphology_process, ')
          ..write('explanation: $explanation, ')
          ..write('meaning: $meaning')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $WordItemsTable wordItems = $WordItemsTable(this);
  late final $AlternationItemsTable alternationItems =
      $AlternationItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wordItems, alternationItems];
}

typedef $$WordItemsTableCreateCompanionBuilder = WordItemsCompanion Function({
  Value<int> idPr,
  required int id,
  required String basic_word,
  required String split_word,
});
typedef $$WordItemsTableUpdateCompanionBuilder = WordItemsCompanion Function({
  Value<int> idPr,
  Value<int> id,
  Value<String> basic_word,
  Value<String> split_word,
});

class $$WordItemsTableFilterComposer
    extends Composer<_$Database, $WordItemsTable> {
  $$WordItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPr => $composableBuilder(
      column: $table.idPr, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get basic_word => $composableBuilder(
      column: $table.basic_word, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get split_word => $composableBuilder(
      column: $table.split_word, builder: (column) => ColumnFilters(column));
}

class $$WordItemsTableOrderingComposer
    extends Composer<_$Database, $WordItemsTable> {
  $$WordItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPr => $composableBuilder(
      column: $table.idPr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get basic_word => $composableBuilder(
      column: $table.basic_word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get split_word => $composableBuilder(
      column: $table.split_word, builder: (column) => ColumnOrderings(column));
}

class $$WordItemsTableAnnotationComposer
    extends Composer<_$Database, $WordItemsTable> {
  $$WordItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPr =>
      $composableBuilder(column: $table.idPr, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get basic_word => $composableBuilder(
      column: $table.basic_word, builder: (column) => column);

  GeneratedColumn<String> get split_word => $composableBuilder(
      column: $table.split_word, builder: (column) => column);
}

class $$WordItemsTableTableManager extends RootTableManager<
    _$Database,
    $WordItemsTable,
    Word,
    $$WordItemsTableFilterComposer,
    $$WordItemsTableOrderingComposer,
    $$WordItemsTableAnnotationComposer,
    $$WordItemsTableCreateCompanionBuilder,
    $$WordItemsTableUpdateCompanionBuilder,
    (Word, BaseReferences<_$Database, $WordItemsTable, Word>),
    Word,
    PrefetchHooks Function()> {
  $$WordItemsTableTableManager(_$Database db, $WordItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> idPr = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> basic_word = const Value.absent(),
            Value<String> split_word = const Value.absent(),
          }) =>
              WordItemsCompanion(
            idPr: idPr,
            id: id,
            basic_word: basic_word,
            split_word: split_word,
          ),
          createCompanionCallback: ({
            Value<int> idPr = const Value.absent(),
            required int id,
            required String basic_word,
            required String split_word,
          }) =>
              WordItemsCompanion.insert(
            idPr: idPr,
            id: id,
            basic_word: basic_word,
            split_word: split_word,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WordItemsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $WordItemsTable,
    Word,
    $$WordItemsTableFilterComposer,
    $$WordItemsTableOrderingComposer,
    $$WordItemsTableAnnotationComposer,
    $$WordItemsTableCreateCompanionBuilder,
    $$WordItemsTableUpdateCompanionBuilder,
    (Word, BaseReferences<_$Database, $WordItemsTable, Word>),
    Word,
    PrefetchHooks Function()>;
typedef $$AlternationItemsTableCreateCompanionBuilder
    = AlternationItemsCompanion Function({
  Value<int> idPr,
  required int id,
  required int wordId,
  required String morphology_process,
  required String explanation,
  required String meaning,
});
typedef $$AlternationItemsTableUpdateCompanionBuilder
    = AlternationItemsCompanion Function({
  Value<int> idPr,
  Value<int> id,
  Value<int> wordId,
  Value<String> morphology_process,
  Value<String> explanation,
  Value<String> meaning,
});

class $$AlternationItemsTableFilterComposer
    extends Composer<_$Database, $AlternationItemsTable> {
  $$AlternationItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPr => $composableBuilder(
      column: $table.idPr, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wordId => $composableBuilder(
      column: $table.wordId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get morphology_process => $composableBuilder(
      column: $table.morphology_process,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meaning => $composableBuilder(
      column: $table.meaning, builder: (column) => ColumnFilters(column));
}

class $$AlternationItemsTableOrderingComposer
    extends Composer<_$Database, $AlternationItemsTable> {
  $$AlternationItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPr => $composableBuilder(
      column: $table.idPr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wordId => $composableBuilder(
      column: $table.wordId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get morphology_process => $composableBuilder(
      column: $table.morphology_process,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meaning => $composableBuilder(
      column: $table.meaning, builder: (column) => ColumnOrderings(column));
}

class $$AlternationItemsTableAnnotationComposer
    extends Composer<_$Database, $AlternationItemsTable> {
  $$AlternationItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPr =>
      $composableBuilder(column: $table.idPr, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get wordId =>
      $composableBuilder(column: $table.wordId, builder: (column) => column);

  GeneratedColumn<String> get morphology_process => $composableBuilder(
      column: $table.morphology_process, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => column);

  GeneratedColumn<String> get meaning =>
      $composableBuilder(column: $table.meaning, builder: (column) => column);
}

class $$AlternationItemsTableTableManager extends RootTableManager<
    _$Database,
    $AlternationItemsTable,
    Alternation,
    $$AlternationItemsTableFilterComposer,
    $$AlternationItemsTableOrderingComposer,
    $$AlternationItemsTableAnnotationComposer,
    $$AlternationItemsTableCreateCompanionBuilder,
    $$AlternationItemsTableUpdateCompanionBuilder,
    (
      Alternation,
      BaseReferences<_$Database, $AlternationItemsTable, Alternation>
    ),
    Alternation,
    PrefetchHooks Function()> {
  $$AlternationItemsTableTableManager(
      _$Database db, $AlternationItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlternationItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlternationItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlternationItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> idPr = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<int> wordId = const Value.absent(),
            Value<String> morphology_process = const Value.absent(),
            Value<String> explanation = const Value.absent(),
            Value<String> meaning = const Value.absent(),
          }) =>
              AlternationItemsCompanion(
            idPr: idPr,
            id: id,
            wordId: wordId,
            morphology_process: morphology_process,
            explanation: explanation,
            meaning: meaning,
          ),
          createCompanionCallback: ({
            Value<int> idPr = const Value.absent(),
            required int id,
            required int wordId,
            required String morphology_process,
            required String explanation,
            required String meaning,
          }) =>
              AlternationItemsCompanion.insert(
            idPr: idPr,
            id: id,
            wordId: wordId,
            morphology_process: morphology_process,
            explanation: explanation,
            meaning: meaning,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AlternationItemsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $AlternationItemsTable,
    Alternation,
    $$AlternationItemsTableFilterComposer,
    $$AlternationItemsTableOrderingComposer,
    $$AlternationItemsTableAnnotationComposer,
    $$AlternationItemsTableCreateCompanionBuilder,
    $$AlternationItemsTableUpdateCompanionBuilder,
    (
      Alternation,
      BaseReferences<_$Database, $AlternationItemsTable, Alternation>
    ),
    Alternation,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$WordItemsTableTableManager get wordItems =>
      $$WordItemsTableTableManager(_db, _db.wordItems);
  $$AlternationItemsTableTableManager get alternationItems =>
      $$AlternationItemsTableTableManager(_db, _db.alternationItems);
}
