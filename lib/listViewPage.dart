import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:second_project/userContactProfile.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> contacts = [
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
    {"name": "abc", "number": "987663425"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: contacts.length,
            itemBuilder: (context, int) => Container(
                  width: 200,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: Text(contacts[int]["name"]),
                                content: Text(contacts[int]["number"]),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Close")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    UserContactProfile(
                                                        userData:
                                                            contacts[int]))));
                                      },
                                      child: Text("Forward")),
                                ],
                              ));
                    },
                    title: Text(
                      contacts[int]["name"],
                    ),
                    subtitle: Text(contacts[int]["number"]),
                  ),
                )),
      ),
    );
  }
}
