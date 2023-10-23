// ignore_for_file: sort_child_properties_last
import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/home_widgets/list.dart';
import 'package:Annekal/pages/instant.dart';
import 'package:Annekal/pages/seller_home/listmani.dart';
import 'package:Annekal/widgets/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/pages/login.dart';

class Scrollableappbar extends StatefulWidget {
  const Scrollableappbar({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() =>
      // ignore: no_logic_in_create_state
      _Scrollableappbar(seller: seller.sellerreq, namee: seller.sellername);
}

class _Scrollableappbar extends State<Scrollableappbar> {
  ScrollController scrollController = ScrollController();
  final bool seller;
  final String namee;
  bool showtAppbar = true;
  bool buttoncheck = false;

  _Scrollableappbar({required this.namee, required this.seller});

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: context.canvasColor,
        body: NestedScrollView(
          controller: scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 0,
                title: Row(
                  children: [
                    Icon(Icons.location_on,
                        color: Theme.of(context).focusColor),
                    Text(
                      !seller ? "BOREWALI,Madras" : namee,
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).focusColor,
                      ),
                    ).expand(),
                  ],
                ),
                floating: true,
                snap: true,
                actions: [
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).canvasColor),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => instantSaves(),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 225, 0, 191)),
                            color: const Color(0xFFF096E2),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: const Icon(
                                  Icons.attach_money_outlined,
                                  color: Color.fromARGB(255, 255, 72, 0),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color: const Color.fromARGB(255, 255, 191, 0),
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 255, 72, 0),
                                  ),
                                ),
                              ).pOnly(left: 2),
                              const Text(
                                "Instant saves",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3E5E4F),
                                ),
                              ).pOnly(right: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ];
          },
          body: !seller
              ? SafeArea(
                  child: Container(
                    padding: Vx.mOnly(left: 17, right: 17),
                    child: Column(
                      children: [
                        // ignore: unnecessary_null_comparison
                        if (Grocerymodel.item != null &&
                            Grocerymodel.item.isNotEmpty)
                          grocerylist().expand()
                        else
                          const CircularProgressIndicator().centered().expand(),
                      ],
                    ),
                  ),
                )
              : SafeArea(
                  child: Container(
                    padding: Vx.mOnly(left: 17, right: 17),
                    child: Column(
                      children: [
                        // ignore: unnecessary_null_comparison
                        if (Grocerymodel.item != null &&
                            Grocerymodel.item.isNotEmpty)
                          listseller(
                            sellername: namee,
                          ).expand()
                        else
                          const CircularProgressIndicator().centered().expand(),
                      ],
                    ),
                  ),
                ),
        ),
        bottomNavigationBar: Bottombar(
          page: "home",
          scrollController: scrollController,
        ),
      ),
    );
  }
}
