// ignore_for_file: depend_on_referenced_packages, no_logic_in_create_state, prefer_collection_literals, unused_local_variable

import 'dart:async';
import 'package:Annekal/models/filteredlist.dart';
import 'package:Annekal/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/homedetail.dart';
import 'package:Annekal/widgets/themes.dart';
import 'gItem.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class grocerylist extends StatefulWidget {
  @override
  State<grocerylist> createState() => _grocerylistState();
}

// ignore: camel_case_types
class _grocerylistState extends State<grocerylist> {
  // ignore: non_constant_identifier_names
  final String shop_img =
      "https://cdn.pixabay.com/photo/2021/05/27/18/55/woman-6289052_640.png";
  late final PageController pageController;
  int pageno = 0;
  late final Timer carasouelTimer;
  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageno == 5) {
        pageno = 0;
      }
      pageController.animateToPage(pageno,
          duration: const Duration(seconds: 2), curve: Curves.easeInCirc);
      pageno++;
    });
  }

  final List<Item> filterlist = Grocerymodel.item;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    carasouelTimer = getTimer();
    showthat.filterlistresult = filterlist;
    showthat.filterlistresultforseller = filterlist;
    filtering();
    filter.filteringseller();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void filtering() {
    var seen = Set<String>();
    showthat.filterlistresult =
        showthat.filterlistresult.where((item) => seen.add(item.name)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Column(children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (index) {
                  pageno = index;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      return child!;
                    },
                    child: GestureDetector(
                      onTap: () {},
                      onPanDown: (details) {
                        carasouelTimer.cancel();
                      },
                      onPanCancel: () {
                        carasouelTimer = getTimer();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(24),
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Mytheme.gr1, Mytheme.gr2],
                              end: Alignment.centerRight,
                              begin: Alignment.topLeft),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Image.network(shop_img)
                            .hFull(context)
                            .wFull(context),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    child: Icon(Icons.circle,
                        size: 12.0,
                        color: pageno == index
                            ? Colors.indigo
                            : const Color.fromARGB(255, 172, 197, 209)),
                  ),
                ),
              ),
            ),
          ]),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: showthat.filterlistresult.length,
            itemBuilder: (context, index) {
              final grocery = showthat.filterlistresult[index];
              // final grocerytezt = showthat.mainfilter1[index];
              // addlistofnames(index, grocery.name);
              return InkWell(
                  onTap: () {
                    setState(() {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homedetail(
                          grocery: grocery,
                        ),
                      ),
                    );
                  },
                  child: groceryItem(grocery: grocery));
            },
          ),
        ],
      ),
    );
  }
}
