import 'package:flutter/material.dart';

import 'core/router/router.dart'; // імпорт маршрутизатора

class MorphologyApp extends StatefulWidget {
  const MorphologyApp({super.key});

  @override
  State<MorphologyApp> createState() => _MorphologyAppState(); // створення стану
}

class _MorphologyAppState extends State<MorphologyApp> {
  final _router = AppRouter(); // створення екземпляра маршрутизатора

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // приховує банер "debug" у правому верхньому куті
      title: 'Morphonology Finder', // заголовок застосунку
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // задає базовий колір теми
        ),
        useMaterial3: true,
      ),
      routerConfig: _router.config(), // налаштування маршрутизації
    );
  }
}
