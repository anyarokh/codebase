import 'package:drift/drift.dart'; // імпортуємо бібліотеку для роботи з базами даних за допомогою Drift

// імпортуємо різні файли в залежності від платформи, щоб мати специфічні реалізації для кожної
import 'platform_stub.dart'
    if (dart.library.io) 'platform_app.dart' // якщо код виконується на платформі, що підтримує Dart IO (наприклад, мобільні платформи, десктопи)
    if (dart.library.js_interop) 'platform_web.dart'; // якщо код виконується на платформі, що підтримує JavaScript (наприклад, веб)

class Platform {
  // статичний метод для створення з'єднання з базою даних, який вибирає правильну платформу для реалізації
  static QueryExecutor createDatabaseConnection(String databaseName) =>
      PlatformInterface.createDatabaseConnection(databaseName); // викликаємо метод з платформонезалежного інтерфейсу
}
