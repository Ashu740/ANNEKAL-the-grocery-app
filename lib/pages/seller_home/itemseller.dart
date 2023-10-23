// ignore_for_file: camel_case_types

import 'package:Annekal/models/cartmodel.dart';
import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/home_widgets/gImage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class itemseller extends StatelessWidget {
  final Item sellerinfo;

  const itemseller({super.key, required this.sellerinfo});
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: SafeArea(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Hero(
            tag: Key(
              sellerinfo.id.toString(),
            ),
            child: groceryImage(
              image: sellerinfo.image,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sellerinfo.name.text
                  .color(Theme.of(context).focusColor)
                  .xl
                  .bold
                  .make(),
              sellerinfo.desc.text
                  .color(Theme.of(context).focusColor)
                  .lg
                  .textStyle(context.captionStyle)
                  .make(),
              Row(
                children: [
                  Container(
                    child: (sellerinfo.quantity == 0)
                        ? Text(
                            "₹${sellerinfo.price}",
                            style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.25,
                          )
                        : VxBuilder(
                            mutations: const {CounterMutation, RemoveMutation},
                            builder: (context, store, status) => Text(
                              "₹${sellerinfo.price * sellerinfo.quantity}",
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.25,
                            ),
                          ),
                  ),
                  ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        VxBox(
                                child: Row(
                          children: [
                            sellerinfo.itemquantity.text
                                .color(Theme.of(context).focusColor)
                                .xl3
                                .bold
                                .make(),
                            " In Stock "
                                .text
                                .color(Theme.of(context).indicatorColor)
                                .lg
                                .make()
                          ],
                        ))
                            .border(
                                width: 1,
                                color: Theme.of(context).indicatorColor)
                            .color(context.canvasColor)
                            .rounded
                            .p12
                            .make(),
                      ]).pOnly(right: 12),
                ],
              ),
            ],
          ),
        ]),
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py12();
  }
}
