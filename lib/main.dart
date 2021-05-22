//Assignment by Frosh Link
import 'package:flutter/material.dart';
import 'fetch_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FetchData(),
    );
  }
}
