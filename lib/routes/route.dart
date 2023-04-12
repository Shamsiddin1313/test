import 'package:fluro/fluro.dart';
import 'package:test_app/app.dart';
import 'package:test_app/home.dart';
import 'package:test_app/screen/spam.dart';

class Application {
  static FluroRouter? router;
}

class AppRoutes {
  static String app = '/';
  static String home = '/home';
  static String spam = '/spam';

  static void defineRoutes(FluroRouter router) {
    router.define(app, handler: appHandler);
    router.define(home, handler: homeHandler);
    router.define(spam, handler: spamHandler);
  }
}

final appHandler = Handler(handlerFunc: (_, __) => const TestApp());

final homeHandler = Handler(handlerFunc: (_, __) => const HomeController());
final spamHandler = Handler(handlerFunc: (_, __) => const SpamController());
