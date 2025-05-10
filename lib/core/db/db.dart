import 'dart:convert'; // для декодування json

import 'package:drift/drift.dart'; // основний пакет для роботи з базою даних
import 'package:flutter/services.dart'; // для доступу до asset-файлів

part 'db.g.dart'; // генерується Drift, містить код для таблиць та доступу

// таблиця для слів
@DataClassName('Word')
class WordItems extends Table {
  IntColumn get idPr => integer().autoIncrement()(); // первинний ключ

  IntColumn get id => integer()(); // зовнішній ідентифікатор або прив'язка до іншої системи

  TextColumn get basic_word => text()(); // базове слово (наприклад, без афіксів)

  TextColumn get split_word => text()(); // розділене слово (можливо, на морфеми)
}

// таблиця для морфонологічних процесів
@DataClassName('Alternation')
class AlternationItems extends Table {
  IntColumn get idPr => integer().autoIncrement()(); // первинний ключ

  IntColumn get id => integer()(); // зовнішній ідентифікатор

  IntColumn get wordId => integer()(); // посилання на ідентифікатор слова

  TextColumn get morphology_process => text()(); // тип морфологічного процесу
  TextColumn get explanation => text()(); // пояснення процесу
  TextColumn? get meaning => text()(); // значення (опціонально)
}

// клас бази даних Drift, включає обидві таблиці
@DriftDatabase(tables: [WordItems, AlternationItems])
class Database extends _$Database {
  Database(super.executor); // передаємо executor (наприклад, LazyDatabase)

  @override
  int get schemaVersion => 1; // версія схеми для міграцій
}

// функція для завантаження json-файлу зі словами та вставки в БД
Future<void> loadJsonAndInsert(Database db) async {
  final jsonString = await rootBundle.loadString('assets/data/word.json'); // зчитування json з assets
  final List<dynamic> jsonList = json.decode(jsonString); // декодування json

  for (var item in jsonList) {
    final row = Word(
      id: item['id'],
      basic_word: item['basic_word'],
      split_word: item['split_word'], idPr: item['id'], // idPr тут заповнюється вручну, хоч він і autoIncrement
    );

    await db.into(db.wordItems).insertOnConflictUpdate(row); // оновлення при конфлікті
  }

  print('✅ Data inserted into Drift DB'); // лог про успішну вставку
}

// функція для завантаження json-файлу з чергуваннями та вставки в БД
Future<void> loadJsonAndInsert2(Database db) async {
  final jsonString =
      await rootBundle.loadString('assets/data/alternation.json'); // зчитування json
  final List<dynamic> jsonList = json.decode(jsonString); // декодування json

  for (var item in jsonList) {
    final row = Alternation(
      id: item['id'],
      idPr: item['id'], // вручну задається idPr
      wordId: item['word_id'],
      explanation: item['explanation'],
      morphology_process: item['morphology_process'],
      meaning: item['meaning'], // це поле може бути null
      // додаткові поля можна додати тут, якщо json містить більше даних
    );

    await db.into(db.alternationItems).insertOnConflictUpdate(row); // оновлення при конфлікті
  }

  print('✅ Data inserted into Drift DB2'); // лог про успішну вставку
}
