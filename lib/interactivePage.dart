import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class InteractivePage extends StatefulWidget {
  const InteractivePage({Key? key}) : super(key: key);

  @override
  State<InteractivePage> createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
  Map<String, dynamic> place = {
    "image":
        "https://images.pexels.com/photos/11789773/pexels-photo-11789773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "name": "Phewa Lake",
    "address": "Pokhara,Kaski",
    "rating": 41,
    "isActive": false,
    "phoneNumber": "9857060570",
    "description":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  };
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(String url) async {
    Uri link = Uri.parse(url);
    if (!await launchUrl(
      link,
      mode: LaunchMode.platformDefault,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 300,
          // color: Colors.black,
          child: Image.network(place["image"]),
        ),
        Container(
          width: double.infinity,
          height: 80,
          // color: Colors.blue,
          child: ListTile(
            title: Text(place["name"]),
            subtitle: Text(place["address"]),
            trailing: Container(
              // color: Colors.red,
              width: 80,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (!place["isActive"]) {
                        setState(() {
                          place["isActive"] = true;
                          place["rating"]++;
                        });
                      } else {
                        setState(() {
                          place["isActive"] = false;
                          place["rating"]--;
                        });
                      }
                    },
                    icon: Icon(
                      place["isActive"] ? Icons.star : Icons.star_border,
                      color: Colors.red,
                    ),
                  ),
                  Text("${place["rating"]}")
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  _makePhoneCall(place["phoneNumber"]);
                },
                child: Container(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      Text(
                        "Call",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchInBrowser("https://www.nike.com/");
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.navigation,
                      color: Colors.blue,
                    ),
                    Text(
                      "Route",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                      Text(
                        "Share  ",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 50,
        // ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Text(place["description"]),
        ),
      ]),
    );
  }
}

class OnPressedChecking extends StatefulWidget {
  const OnPressedChecking({Key? key}) : super(key: key);

  @override
  State<OnPressedChecking> createState() => _OnPressedCheckingState();
}

class _OnPressedCheckingState extends State<OnPressedChecking> {
  int currentId = 0;
  List<Map<String, dynamic>> buttons = [
    {"a": 5, "b": 10, "color": Colors.blue},
    {"a": 2, "b": 13, "color": Colors.red},
    {"a": 15, "b": 1, "color": Colors.amber},
    {"a": 50, "b": 100, "color": Colors.green},
    {"a": 10, "b": 10, "color": Colors.purple},
  ];

  double currentAvg = 0.00;

  calculateAvg(int a, int b) {
    double avg = (a + b) / 2;
    setState(() {
      currentAvg = avg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Text("$currentAvg"),
          ),
          Container(
            child: Column(
              children: buttons
                  .asMap()
                  .entries
                  .map((e) => ElevatedButton(
                      onPressed: () {
                        calculateAvg(e.value["a"], e.value["b"]);
                      },
                      child: Text("${e.value["a"]}, ${e.value["b"]}")))
                  .toList(),
            ),
          )
        ],
      )),
    );
  }
}
