// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/seller_home/itemseller.dart';
import 'package:flutter/material.dart';

class listseller extends StatefulWidget {
  final String sellername;
  const listseller({required this.sellername});
  // ignore: prefer_const_constructors_in_immutables

  @override
  // ignore: no_logic_in_create_state
  State<listseller> createState() => _listseller(newsellername: sellername);
}

class _listseller extends State<listseller> {
  final String newsellername;
  List<Item> listshop = Grocerymodel.item;
  List<Item> resultseller = Grocerymodel.item;

  @override
  void initState() {
    super.initState();
    resultseller = listshop;
    filter(newsellername);
  }

  void filter(String sellername) {
    setState(() {
      resultseller = listshop
          .where(
            (shopkeeper) => shopkeeper.sellername
                .toLowerCase()
                .contains(newsellername.toLowerCase()),
          )
          .toList();
    });
  }

  _listseller({required this.newsellername});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: resultseller.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final sellerinfo = resultseller[index];
          return InkWell(
            // onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => sellerhomedetail(),
            //     )),
            child: itemseller(sellerinfo: sellerinfo),
          );
        },
      ),
    );
  }
}
