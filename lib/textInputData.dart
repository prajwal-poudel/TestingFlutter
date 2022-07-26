import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextInputData extends StatefulWidget {
  const TextInputData({Key? key}) : super(key: key);

  @override
  State<TextInputData> createState() => _TextInputDataState();
}

class _TextInputDataState extends State<TextInputData> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPassword = true;
  bool isError = false;
  String errorMessage = "";
  List<Map<String, String>> users = [
    {"id": "17", "userName": "123", "password": "123@123"},
    {"id": "16", "userName": "1234", "password": "1234@1234"},
    {"id": "15", "userName": "qwe", "password": "qwe@qwe"},
    {"id": "14", "userName": "asd", "password": "asd@asd"},
    {"id": "13", "userName": "zxc", "password": "zxc@zxc"},
    {"id": "12", "userName": "098", "password": "098@098"},
  ];
  loginHandler(String userName, String password) {
    print(userName);
    print(password);
    for (int i = 0; i < users.length; i++) {
      if (users[i]["userName"] == userName) {
        if (users[i]["password"] == password) {
          setState(() {
            isError = true;
            errorMessage = "SucessFully LogedIn!!";
          });
        } else {
          setState(() {
            isError = true;
            errorMessage = "Password Not Matched!!";
          });
        }
        break;
      } else {
        setState(() {
          isError = true;
          errorMessage = "User Not Found!!";
        });
      }
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/4051221/pexels-photo-4051221.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                    fit: BoxFit.cover)),
          ),
          Container(
            color: Colors.grey.withOpacity(0.7),
          ),
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        helperText: "Helper Text",
                        hintText: "user@gmail.com",
                        prefixIcon: Icon(Icons.mail)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email Field Can't be empty!!";
                      }
                    },
                  ),
                  TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    obscureText: showPassword,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        labelText: "Password",
                        helperText: "Password ust be 8 character Long",
                        prefixIcon: Icon(Icons.lock),
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Field Can't be empty!!";
                      }
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Further aheaad

                          loginHandler(email.text.trim(), password.text.trim());
                          email.clear();
                          password.clear();
                        } else {
                          // error
                          return;
                        }
                      },
                      child: Text("Login")),
                  if (isError)
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
