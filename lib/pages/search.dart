// ignore_for_file: depend_on_referenced_packages, prefer_collection_literals

import 'package:Annekal/models/filteredlist.dart';
import 'package:Annekal/widgets/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/homedetail.dart';
import 'package:Annekal/widgets/appbar.dart';
import 'home_widgets/gitem.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class searching extends StatefulWidget {
  const searching({super.key});
  @override
  State<searching> createState() => _searchingState();
}

// ignore: camel_case_types

// ignore: camel_case_types
class _searchingState extends State<searching> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController editingController = TextEditingController();
  List<Item> listd = showthat.filterlistresult;
  List<Item> list = [];

  List<Item> results = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          setState(() {
            showtAppbar = false;
            // print(showtAppbar);
          });
        } else {
          setState(() {
            showtAppbar = true;
          });
        }
      },
    );
    list = listd;
    results = list;
  }

  bool showtAppbar = true;

  // ignore: unused_element
  void _runfilter(String enteredvalue) {
    setState(() {
      results = list
          .where(
            (things) =>
                things.name.toLowerCase().contains(enteredvalue.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Sappbar(
                title: "Search",
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _runfilter(value);
                  });
                },
                controller: editingController,
                decoration: InputDecoration(
                  iconColor: context.cardColor,
                  contentPadding: const EdgeInsets.all(
                    30,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Theme.of(context).focusColor),
                  suffixIcon:
                      Icon(Icons.search, color: Theme.of(context).focusColor),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Theme.of(context).focusColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Theme.of(context).focusColor)),
                ),
                style: TextStyle(color: Theme.of(context).focusColor),
              ).pOnly(left: 20, right: 20),
              SingleChildScrollView(
                child: results.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          final grocery = results[index];
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
                              child: groceryItem(grocery: grocery));
                        },
                      ).pOnly(left: 20, right: 20)
                    : "No results found"
                        .text
                        .xl3
                        .center
                        .bold
                        .color(Theme.of(context).focusColor)
                        .make()
                        .pOnly(top: 150),
              )
            ],
          ),
        ),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Bottombar(
          page: "search",
          scrollController: _scrollController,
        ),
      ),
    );
  }
}
