// ignore_for_file: use_key_in_widget_constructors, depend_on_referenced_packages, unused_field, prefer_final_fields, must_be_immutable

import 'package:Annekal/widgets/appbar.dart';
import 'package:Annekal/widgets/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/core/store.dart';
import 'package:Annekal/models/cartmodel.dart';

// ignore: camel_case_types
class mycart extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Sappbar(
              title: "Shopping Cart",
            ),
            _CartList().p32().expand(),
            const Divider(),
            _CartTotal(),
          ],
        ),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Bottombar(
          page: "cart",
          scrollController: _scrollController,
        ),
      ),
    );
  }
}

// ignore: camel_case_types

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final Cartmodel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxBuilder(
          mutations: const {RemoveMutation, CounterMutation},
          builder: ((context, store, status) => "₹${_cart!.totalPrize}"
              .text
              .xl4
              .color(Theme.of(context).focusColor)
              .make()),
        ),
        30.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Buying not supported yet".text.make(),
            ));
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).indicatorColor),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          child: "Buy".text.xl.color(Theme.of(context).cardColor).make(),
        ).w32(context)
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
//   Grocerymodel? _grocery;
//   final List<int> _itemIds = [];

//   // ignore: prefer_typing_uninitialized_variables
//   var count;
//   Grocerymodel get grocery => _grocery!;
// //=grocery
//   set grocery(Grocerymodel newGrocery) {
//     // ignore: unnecessary_nularison, unnecessary_null_comparison
//     assert(newGrocery != null);
//     _grocery = newGrocery;
//   }

//   List<Item> get item => _itemIds.map((id) => _grocery!.getById(id)).toList();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final Cartmodel? _cart = (VxState.store as MyStore).cart;
    return _cart!.item.isEmpty
        ? "Nothing to Show Here"
            .text
            .color(Theme.of(context).focusColor)
            .xl3
            .makeCentered()
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _cart.item.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done, color: Theme.of(context).focusColor),
                trailing: IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Theme.of(context).focusColor,
                  ),
                  onPressed: () => RemoveMutation(
                      item: _cart.item[index], index: _cart.item[index]),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cart.item[index].name.text
                        .color(Theme.of(context).focusColor)
                        .make(),
                    Container(
                      decoration: BoxDecoration(
                          color: Vx.red400,
                          border:
                              Border.all(color: Theme.of(context).focusColor),
                          borderRadius: BorderRadius.circular(30)),
                      child: "${_cart.item[index].quantity}"
                          .text
                          .color(Vx.white)
                          .center
                          .make(),
                    ).w8(context),
                  ],
                )),
          );
  }
}
