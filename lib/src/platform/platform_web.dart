import 'package:drift/drift.dart'; // імпортуємо бібліотеку Drift для роботи з базами даних
import 'package:drift/wasm.dart'; // імпортуємо підтримку для Wasm (WebAssembly) баз даних
import 'package:flutter/foundation.dart'; // імпортуємо для використання kReleaseMode (перевірка на режим релізу)

class PlatformInterface {
  // статичний метод для створення з'єднання з базою даних
  static QueryExecutor createDatabaseConnection(String databaseName) {
    // повертаємо відкладене з'єднання з базою даних
    return DatabaseConnection.delayed(Future(() async {
      // база файлу sqlite3.wasm, яка використовується для WASM
      final base = 'sqlite3.wasm';
      // визначаємо базовий URI для завантаження sqlite3.wasm в залежності від режиму
      final baseUri = Uri.base.resolve(base).toString();
      // відкриваємо базу даних з використанням WasmDatabase
      final database = await WasmDatabase.open(
        databaseName: databaseName, // передаємо ім'я бази даних
        sqlite3Uri: Uri.parse(baseUri), // передаємо URI до файлу sqlite3.wasm
        driftWorkerUri: Uri.parse(
          kReleaseMode ? '/worker.dart.min.js' : '/worker.dart.js', // використовуємо скомпільовані скрипти worker для різних режимів
        ),
      );
      // повертаємо executor для цієї бази даних
      return database.resolvedExecutor;
    }));
  }
}
