import 'package:flutter/material.dart';

import 'dart:convert'; // для декодування JSON
import 'package:drift/drift.dart'; // для роботи з базою даних Drift
import 'package:flutter/foundation.dart'; // для compute() та ValueNotifier
import 'package:flutter/services.dart'; // для rootBundle і доступу до ресурсів

import 'package:flutter_web_worker_example/core/db/db.dart'; // локальне оголошення бази даних
import 'package:flutter_web_worker_example/services/app_loading_indicator.dart'; // індикатор завантаження
import 'package:flutter_web_worker_example/src/platform/platform.dart'; // створення з'єднання з БД для потрібної платформи

late Database database; // оголошення глобальної змінної для бази даних
final stopwatch = Stopwatch(); // секундомір для заміру тривалості імпорту
final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false); // флаг для оновлення інтерфейсу під час завантаження

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // ініціалізація Flutter до запуску
  runApp(const AppLoadingIndicator()); // запуск додатку з індикатором завантаження
  stopwatch.start(); // запуск секундоміра
  database = Database(Platform.createDatabaseConnection('sample')); // створення бази даних
  _initializeDatabase(); // початок ініціалізації бази
}

Future<void> _initializeDatabase() async {
  isLoadingNotifier.value = true; // встановлення флагу "завантаження"
  await loadJsonAndInsert(database); // завантаження та вставка слів
  await loadJsonAndInsert2(database); // завантаження та вставка процесів
  isLoadingNotifier.value = false; // скидання флагу після завершення
}

Future<void> loadJsonAndInsert(Database db) async {
  final jsonString = await rootBundle.loadString('assets/data/word.json');// зчитування JSON-файлу зі словами
  final words = await compute(parseWords, jsonString); // обробка JSON-файлу

  await db.batch((batch) {
    batch.insertAll(db.wordItems, words, mode: InsertMode.insertOrReplace); // пакетне вставлення даних у БД
  });

  debugPrint('✅ Data inserted into Drift DB');
}

Future<void> loadJsonAndInsert2(Database db) async {
  final jsonString =
      await rootBundle.loadString('assets/data/alternation.json'); // зчитування JSON-файлу з чергуваннями
  final alternations = await compute(parseAlternations, jsonString);

  await db.batch((batch) {
    batch.insertAll(db.alternationItems, alternations,
        mode: InsertMode.insertOrReplace); // вставка даних у таблицю alternationItems
  });
  stopwatch.stop(); // зупинка секундоміра
  debugPrint('✅ Data batch-inserted in ${stopwatch.elapsedMilliseconds} ms'); // лог тривалості

  debugPrint('✅ Data inserted into Drift DB2'); // лог завершення
}

Future<List<Word>> parseWords(String jsonString) async {
  final List<dynamic> jsonList = json.decode(jsonString); // декодування JSON у список
  return jsonList
      .map((item) => Word(
            id: item['id'], // заповнення об'єкта Word з полів JSON
            basic_word: item['basic_word'],
            split_word: item['split_word'],
            idPr: item['id'],
          ))
      .toList();// повертаємо список об'єктів Word
}

Future<List<Alternation>> parseAlternations(String jsonString) async {
  final List<dynamic> jsonList = json.decode(jsonString); // декодування JSON у список
  return jsonList
      .map((item) => Alternation(
            id: item['id'], // створення об'єкта Alternation на основі JSON
            idPr: item['id'],
            wordId: item['word_id'],
            morphology_process: item['morphology_process'],
            explanation: item['explanation'],
            meaning: item['meaning'],
          ))
      .toList(); // повернення списку Alternation
}
