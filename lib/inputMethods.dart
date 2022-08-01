import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputMethods extends StatefulWidget {
  const InputMethods({Key? key}) : super(key: key);

  @override
  State<InputMethods> createState() => _InputMethodsState();
}

class _InputMethodsState extends State<InputMethods> {
  static List<String> fruits = [
    "Apple",
    "Banana",
    "Orange",
    "Pineapple",
    "Mango",
  ];
  String selectedFruit = fruits.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          DropdownButton(
              value: selectedFruit,
              items: fruits.map((String item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedFruit = value!;
                });
              })
        ],
      )),
    );
  }
}
