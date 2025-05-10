// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [TitleScreen]
class TitleRoute extends PageRouteInfo<void> {
  const TitleRoute({List<PageRouteInfo>? children})
    : super(TitleRoute.name, initialChildren: children);

  static const String name = 'IntroduceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TitleScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [SpreadsheetScreen]
class SpreadsheetRoute extends PageRouteInfo<SpreadsheetRouteArgs> {
  SpreadsheetRoute({
    Key? key,
    bool showBackButton = false,
    List<PageRouteInfo>? children,
  }) : super(
         SpreadsheetRoute.name,
         args: SpreadsheetRouteArgs(key: key, showBackButton: showBackButton),
         initialChildren: children,
       );

  static const String name = 'SpreadsheetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SpreadsheetRouteArgs>(
        orElse: () => const SpreadsheetRouteArgs(),
      );
      return SpreadsheetScreen(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class SpreadsheetRouteArgs {
  const SpreadsheetRouteArgs({this.key, this.showBackButton = false});

  final Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'SpreadsheetRouteArgs{key: $key, showBackButton: $showBackButton}';
  }
}

/// generated route for
/// [WordDetailsScreen]
class WordDetailsRoute extends PageRouteInfo<WordDetailsRouteArgs> {
  WordDetailsRoute({
    Key? key,
    required WordModel wordModel,
    List<PageRouteInfo>? children,
  }) : super(
         WordDetailsRoute.name,
         args: WordDetailsRouteArgs(key: key, wordModel: wordModel),
         initialChildren: children,
       );

  static const String name = 'WordDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WordDetailsRouteArgs>();
      return WordDetailsScreen(key: args.key, wordModel: args.wordModel);
    },
  );
}

class WordDetailsRouteArgs {
  const WordDetailsRouteArgs({this.key, required this.wordModel});

  final Key? key;

  final WordModel wordModel;

  @override
  String toString() {
    return 'WordDetailsRouteArgs{key: $key, wordModel: $wordModel}';
  }
}

/// generated route for
/// [WordSearchScreen]
class WordSearchRoute extends PageRouteInfo<void> {
  const WordSearchRoute({List<PageRouteInfo>? children})
    : super(WordSearchRoute.name, initialChildren: children);

  static const String name = 'WordSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WordSearchScreen();
    },
  );
}
