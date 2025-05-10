import 'package:flutter_web_worker_example/core/db/db.dart';
import 'package:flutter_web_worker_example/features/word_search/data/models/word.dart';

class SpreadsheetModel {
  final WordModel wordModel; // модель слова
  final Alternation? info; // інформація про слово (морфонологія тощо)

  SpreadsheetModel({
    required this.wordModel,
    required this.info,
  });
}