import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_flutter_project/page_home.dart';
import 'package:my_flutter_project/title_section.dart';
import 'package:my_flutter_project/topic_list.dart';
import 'package:my_flutter_project/topic_models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Main Menu'),
    );
  }
}


