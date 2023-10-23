// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, unused_element, depend_on_referenced_packages, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/models/cartmodel.dart';
import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/home_widgets/addtocart.dart';

import 'gImage.dart';

// ignore: camel_case_types
class groceryItem extends StatelessWidget {
  final Item grocery;

  const groceryItem({super.key, required this.grocery});
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(
            grocery.id.toString(),
          ),
          child: groceryImage(
            image: grocery.image,
          ),
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                grocery.name.text
                    .color(Theme.of(context).focusColor)
                    .xl
                    .bold
                    .make(),
                grocery.desc.text
                    .color(Theme.of(context).focusColor)
                    .lg
                    .textStyle(context.captionStyle)
                    .make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: (grocery.quantity == 0)
                          ? Text(
                              "₹${grocery.price}",
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.25,
                            )
                          : VxBuilder(
                              mutations: const {
                                CounterMutation,
                                RemoveMutation
                              },
                              builder: (context, store, status) => Text(
                                "₹${grocery.price * grocery.quantity}",
                                style: TextStyle(
                                  color: Theme.of(context).focusColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 1.25,
                              ),
                            ),
                    ),
                    AddtoCart(grocery: grocery),
                  ],
                ).pOnly(right: 10)
              ]),
        )
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py12();
  }
}
