import 'package:flutter/material.dart';

import 'package:flutter_web_worker_example/core/db/db.dart';
import 'package:flutter_web_worker_example/features/spreadsheet/data/models/spreadsheet_model.dart';
import 'package:flutter_web_worker_example/features/word_search/data/models/word.dart';
import 'package:flutter_web_worker_example/main.dart';

class SpreadsheetRepository {
  SpreadsheetRepository();

  // функція для отримання даних таблиці
  Future<List<SpreadsheetModel>> fetchSpreadsheetData() async {
    try {
      // отримуємо всі записи чергувань
      final alt = await (database.select(database.alternationItems)).get();
      // витягуємо ідентифікатори слів, до яких вони належать
      final ids = alt.map((e) => e.wordId).toList();
      // вибираємо відповідні слова з таблиці wordItems
      final words = await (database.select(database.wordItems)
            ..where((tbl) => tbl.id.isIn(ids)))
          .get();

      // об'єднуємо дані чергування та слова в один список моделей
      return alt.map((altItem) {
        // знаходимо відповідне слово для кожного чергування
        final matchingWord = words.firstWhere(
          (word) => word.id == altItem.wordId,
          orElse: () => Word(
            idPr: 0,
            id: 0,
            basic_word: '',
            split_word: '',
          ),
        );

        // повертаємо модель з об'єднаними даними
        return SpreadsheetModel(
          wordModel: WordModel(
            wordId: matchingWord.id,
            wordBasicWord: matchingWord.basic_word,
            wordSplitWord: matchingWord.split_word,
          ),
          info: altItem,
        );
      }).toList();
    } catch (e, s) {
      // виводимо помилку, якщо щось пішло не так
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: s);
      return []; // повертаємо порожній список у разі помилки
    }
  }
}
