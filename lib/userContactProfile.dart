import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserContactProfile extends StatefulWidget {
  UserContactProfile({Key? key, required Map<String, dynamic> this.userData})
      : super(key: key);

  Map<String, dynamic> userData;

  @override
  State<UserContactProfile> createState() =>
      _UserContactProfileState(userValue: userData);
}

class _UserContactProfileState extends State<UserContactProfile> {
  _UserContactProfileState({required Map<String, dynamic> this.userValue});

  Map<String, dynamic> userValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Text(userValue["name"] + userValue["number"]),
    );
  }
}
