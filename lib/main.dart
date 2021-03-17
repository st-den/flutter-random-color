// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Task',
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme:
            Typography.englishLike2018.merge(Typography.whiteMountainView),
        dialogTheme: DialogTheme(
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
          contentTextStyle: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black),
        ),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.white),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
