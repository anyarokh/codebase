import 'dart:io'; // імпортуємо бібліотеку для роботи з файлами та файловою системою

import 'package:drift/drift.dart'; // імпортуємо Drift для роботи з базами даних
import 'package:drift/native.dart'; // імпортуємо NativeDatabase для роботи з SQLite в мобільних додатках
import 'package:path/path.dart'; // імпортуємо для роботи з шляхами до файлів
import 'package:path_provider/path_provider.dart'; // імпортуємо для отримання шляху до документів програми

class PlatformInterface {
  // статичний метод для створення з'єднання з базою даних
  static QueryExecutor createDatabaseConnection(String databaseName) {
    return LazyDatabase(() async {
      // отримуємо директорію для збереження файлів програми
      final dbFolder = await getApplicationDocumentsDirectory();
      // формуємо шлях до бази даних, додаючи розширення .sqlite
      final file = File(join(dbFolder.path, '$databaseName.sqlite'));
      // створюємо і повертаємо об'єкт NativeDatabase для роботи з SQLite
      return NativeDatabase(file);
    });
  }
}
