import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/comment_bloc.dart';
import 'package:test_app/home.dart';
import 'package:test_app/routes/route.dart';
import 'package:test_app/size_config.dart';
import 'package:test_app/theme/theme.dart';

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  final router = FluroRouter();
  String? initialMessage;
  bool resolved = false;

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    AppRoutes.defineRoutes(router);
    Application.router = router;
  }

  /// --- Widgets ---

  Widget get materialApp => CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => "",
      theme: theme,
      onGenerateRoute: Application.router?.generator,
      home: const HomeController());

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints);
        return MultiBlocProvider(
            providers: [BlocProvider(create: (_) => CommentBloc())],
            child: materialApp);
      });
}
