import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowFullImage extends StatefulWidget {
  const ShowFullImage({Key? key}) : super(key: key);

  @override
  State<ShowFullImage> createState() => _ShowFullImageState();
}

class _ShowFullImageState extends State<ShowFullImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
          child: Image.network(
              "https://images.pexels.com/photos/7657346/pexels-photo-7657346.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
        ),
      ),
    );
  }
}
