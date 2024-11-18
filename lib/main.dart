import 'package:flutter/material.dart';
import 'scientific_calculator.dart';
import 'conversion_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: ScientificCalculator(toggleTheme: toggleTheme),
      routes: {
        '/conversion': (context) => ConversionScreen(),
      },
    );
  }
}
