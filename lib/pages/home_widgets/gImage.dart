// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class groceryImage extends StatelessWidget {
  final String image;

  const groceryImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p12
        .color(context.canvasColor)
        .make()
        .p12()
        .w40(context);
  }
}
