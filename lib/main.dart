import 'package:flutter/material.dart';
import 'package:oceans_task/pages/pages.dart';
import 'package:oceans_task/services/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    
      home:   SignUpPage(),
    );
  }
}
