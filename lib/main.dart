import 'package:first_app/layout/onboareding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.red),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
            backgroundColor: Colors.white38
          ),
          color: Colors.white38,
          elevation: 0.0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 2.0,
          selectedItemColor: Colors.amberAccent,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.amber),
      ),
      home: OnboardingScreen(),
    );
  }
}
