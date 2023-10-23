// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/core/store.dart';
import 'package:Annekal/models/cartmodel.dart';
import 'package:Annekal/models/model.dart';

// ignore: must_be_immutable
class AddtoCart extends StatelessWidget {
  final Item grocery;
  // ignore: prefer_const_constructors_in_immutables
  AddtoCart({
    Key? key,
    required this.grocery,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, CounterMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final Cartmodel? _cart = (VxState.store as MyStore).cart;
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    int? _num = (VxState.store as MyStore).counter;
    // ignore: no_leading_underscores_for_local_identifiers

    bool isIncart = _cart!.item.contains(grocery);
    return ElevatedButton(
      onPressed: () {
        if (!isIncart) {
          AddMutation(item: grocery);
        }
        CounterMutation(index: grocery);
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).indicatorColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      child: grocery.quantity != 0
          ? VxBuilder(
              mutations: const {CounterMutation, RemoveMutation},
              builder: (context, index, status) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            CounterMutation(index: grocery);
                          },
                          icon: grocery.itemquantity > grocery.quantity
                              ? Icon(
                                  Icons.add,
                                  color: context.cardColor,
                                )
                              : ScaffoldMessenger(
                                  child: "Max "
                                      .text
                                      .color(context.cardColor)
                                      .make(),
                                )),
                      Text(
                        "${grocery.quantity}",
                        style: TextStyle(
                          color: context.cardColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          RemoveMutation(item: grocery, index: grocery);
                        },
                        icon: Icon(
                          Icons.remove,
                          color: context.cardColor,
                        ),
                      ),
                    ],
                  ))
          : Icon(
              Icons.shopping_cart_rounded,
              color: context.cardColor,
            ).w20(context),
    );
  }
}
