import 'package:flutter/material.dart';
import 'package:second_project/inputMethods.dart';
import 'package:second_project/interactivePage.dart';
import 'package:second_project/listViewPage.dart';
import 'package:second_project/textInputData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListViewPage(),
    );
  }
}
