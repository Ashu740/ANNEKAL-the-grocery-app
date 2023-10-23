// ignore_for_file: file_names, camel_case_types

import 'package:Annekal/models/model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class griditem extends StatelessWidget {
  final Item grocery;
  const griditem({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: GridTile(
        header: Container(
                color: context.cardColor,
                child: grocery.sellername.text
                    .color(Theme.of(context).focusColor)
                    .make()
                    .p8())
            .pOnly(bottom: 4),
        footer: Container(
                color: context.cardColor,
                child: "₹${grocery.price}"
                    .text
                    .color(Theme.of(context).focusColor)
                    .make()
                    .p8())
            .pOnly(top: 4),
        child: VxBox(
          child: Image.network(
            grocery.image,
          ).p32(),
        ).color(context.canvasColor).roundedLg.make(),
      ).p12(),
    ).p0();
  }
}
