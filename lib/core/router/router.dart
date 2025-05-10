import 'package:flutter/material.dart'; // імпорт Material Design для UI
import 'package:auto_route/auto_route.dart'; // імпорт для авто-маршрутів (навігації)

import 'package:flutter_web_worker_example/features/home/view/home_screen.dart';
import 'package:flutter_web_worker_example/features/main/view/main_screen.dart';
import 'package:flutter_web_worker_example/features/spreadsheet/view/spreadsheet_screen.dart';
import 'package:flutter_web_worker_example/features/title/view/title_screen.dart';
import 'package:flutter_web_worker_example/features/word_details/view/word_details_screen.dart';
import 'package:flutter_web_worker_example/features/word_search/data/models/word.dart';
import 'package:flutter_web_worker_example/features/word_search/view/word_search_screen.dart';

part 'router.gr.dart'; // файл для генерації коду маршрутизації, необхідний для auto_route

@AutoRouterConfig() // маркер для створення класу маршрутизації
class AppRouter extends RootStackRouter { // клас для конфігурації маршрутів, який успадковує RootStackRouter
  @override
  List<AutoRoute> get routes { // список всіх маршрутів, які будуть доступні в додатку
    return [
      // маршрут для стартового екрану
      AutoRoute(
        page: TitleRoute.page, // вказує на сторінку TitleScreen
        path: '/', // URL-шлях до екрану
      ),
      // маршрут для екрану Home
      AutoRoute(
        page: HomeRoute.page,
        path: '/main',
      ),
      // маршрут для детальної інформації про слово
      AutoRoute(
        page: WordDetailsRoute.page,
        path: '/word_details',
      ),
      // маршрут для екрану таблиці
      AutoRoute(
        page: SpreadsheetRoute.page,
        path: '/spreadsheet',
      ),
    ];
  }
}
