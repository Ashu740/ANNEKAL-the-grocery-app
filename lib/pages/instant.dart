// ignore_for_file: depend_on_referenced_packages

import 'package:Annekal/models/filteredlist.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/home_widgets/instantgitem.dart';
import 'package:Annekal/pages/homedetail.dart';
import 'package:Annekal/widgets/appbar.dart';

// ignore: camel_case_types, must_be_immutable
class instantSaves extends StatelessWidget {
  instantSaves({super.key});

  final List<Item> _sortedlist = showthat.filterlistresult;

  List<Item> _sortedlistshowing = [];

  @override
  Widget build(BuildContext context) {
    _sortedlistshowing = _sortedlist;
    _sortedlistshowing.sort(
      (a, b) => a.price.compareTo(b.price),
    );

    // _sortprice(_sortedlistshowing);
    // ignore: prefer_const_constructors
    return SafeArea(
      // ignore: prefer_const_constructors
      child: Scaffold(
        // ignore: prefer_const_constructors
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Sappbar(
                title: "Best Deals",
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _sortedlistshowing.length,
                itemBuilder: (context, index) {
                  final grocery = _sortedlistshowing[index];
                  // addlistofnames(index, grocery.name);
                  return InkWell(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homedetail(
                                grocery: grocery,
                              ),
                            ),
                          ),
                      child: instantgroceryItem(grocery: grocery));
                },
              ).pOnly(left: 20, right: 20)
            ],
          ),
        ),
      ),
    );
  }
}
