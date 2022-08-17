import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/pages/third_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multiplatform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ThirdPage(),
    );
  }
}
