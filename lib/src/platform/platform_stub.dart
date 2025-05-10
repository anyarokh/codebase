import 'package:drift/drift.dart';

class PlatformInterface {
  // статичний метод для створення з'єднання з базою даних
  static QueryExecutor createDatabaseConnection(String databaseName) =>
      throw UnsupportedError(
          'Cannot create a client without dart:html or dart:io');
}
