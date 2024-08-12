import 'package:flutter/material.dart';
import 'pages/weather_pages.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Myapp> {
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: WeatherPage(
        isDarkMode:_isDarkMode ,
        toggelDarkMode: _toggleDarkMode,
        )
       
    );
  }
}
