import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class Sappbar extends StatelessWidget {
  final String title;
  const Sappbar({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName("/home")
                // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                );
          },
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).canvasColor),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).focusColor,
          ),
        ),
        Container(
          child: title.text.bold.color(Theme.of(context).focusColor).xl5.make(),
        ).pOnly(top: 20, right: 20, bottom: 20),
      ],
    );
  }
}
