// ignore_for_file: prefer_const_constructors, duplicate_ignore, sort_child_properties_last, depend_on_referenced_packages, unused_local_variable
import 'dart:async';
import 'package:Annekal/widgets/scrollableappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:Annekal/core/store.dart';
import 'package:Annekal/models/model.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  final bool seller;
  final String namee;
  const Homepage({super.key, required this.seller, required this.namee});

  @override
  // ignore: no_logic_in_create_state
  State<Homepage> createState() => _HomepageState(seller: seller, namee: namee);
}

class _HomepageState extends State<Homepage> {
  final bool seller;
  final String namee;
  ScrollController scrollController = ScrollController();

  _HomepageState({
    required this.seller,
    required this.namee,
  });

  @override
  void initState() {
    super.initState();
    loadData();
    scrollController.addListener(
      () {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          showtAppbar = false;
          setState(() {});
        } else {
          showtAppbar = true;
          setState(() {});
        }
      },
    );
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var productJson = await rootBundle.loadString("assest/files/seller.json");
    var decodedData = jsonDecode(productJson);
    var productData = decodedData["allsellingproducts"];
    Grocerymodel.item =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  bool showtAppbar = true;
  bool buttoncheck = false;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => Grocerymodel.item[0]);
    return Scrollableappbar();
  }
}
