import 'package:flutter/material.dart';
import 'calendar_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static String title = 'UNI Calendar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const CalendarPage(),
    );
  }
}
