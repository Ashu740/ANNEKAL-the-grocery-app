// ignore_for_file: sort_child_properties_last, no_logic_in_create_state

import 'package:Annekal/core/store.dart';
import 'package:Annekal/models/cartmodel.dart';
import 'package:Annekal/pages/cart.dart';
import 'package:Annekal/pages/profile.dart';
import 'package:Annekal/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:Annekal/pages/login.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

class Bottombar extends StatefulWidget {
  final String page;
  final ScrollController scrollController;
  const Bottombar(
      {super.key, required this.page, required this.scrollController});
  @override
  State<Bottombar> createState() =>
      _BottombarState(page: page, scrollController: scrollController);
}

class _BottombarState extends State<Bottombar> {
  final String page;
  // static List<String> listpage = [];
  final ScrollController? scrollController;
  bool showtAppbar = true;

  _BottombarState({required this.scrollController, required this.page});
  @override
  void initState() {
    super.initState();
    scrollController?.addListener(() {
      if (scrollController?.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showtAppbar = false;
        setState(() {});
      } else {
        showtAppbar = true;
        setState(() {});
      }
    });
  }

  void listofpanne(int i) {
    // listpage[i] = page;
  }

  @override
  Widget build(BuildContext context) {
    // listofpanne(listpage.length);
    // ignore: no_leading_underscores_for_local_identifiers
    final _cart = (VxState.store as MyStore).cart;
    return AnimatedContainer(
      child: BottomAppBar(
        color: context.cardColor,
        elevation: 0.0,
        notchMargin: 8.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            icon: const Icon(Icons.home_filled),
            color: page == "home"
                ? const Color(0xffEFA617)
                : Theme.of(context).focusColor,
            onPressed: () {
              page == "home"
                  ? {}
                  : Navigator.popUntil(context, ModalRoute.withName("/home")
                      // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                      );
            },
          ),
          IconButton(
            onPressed: () {
              page == "search"
                  ? {}
                  : page == "home"
                      ? Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 0),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const searching()),
                          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        )
                      : Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 0),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const searching()),
                          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        );
            },
            icon: Icon(
              Icons.search,
              color: page == "search"
                  ? const Color(0xffEFA617)
                  : Theme.of(context).focusColor,
            ),
          ),
          VxBuilder(
            mutations: const {AddMutation, RemoveMutation},
            builder: (context, store, status) => IconButton(
              onPressed: () {
                page == "cart"
                    ? {}
                    : page == "home"
                        ? Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 0),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        mycart()),
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                          )
                        : Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 0),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        mycart()),
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                          );
              },
              icon: Icon(
                page == "cart"
                    ? Icons.shopping_cart_rounded
                    : Icons.shopping_cart_outlined,
                color: page == "cart"
                    ? const Color(0xffEFA617)
                    : Theme.of(context).focusColor,
              ),
            ).badge(
                color: Vx.red500,
                count: _cart?.item.length,
                size: _cart!.item.isNotEmpty ? 20 : 0,
                textStyle: const TextStyle(color: Colors.white)),
          ),
          IconButton(
            onPressed: () {
              page == "profile"
                  ? {}
                  : page == "home"
                      ? Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 0),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      profile(
                                        seller: seller.sellerreq,
                                      )),
                          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        )
                      : Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 0),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      profile(
                                        seller: seller.sellerreq,
                                      )),
                          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        );
            },
            icon: Icon(
              page == "profile"
                  ? Icons.person_2_rounded
                  : Icons.person_2_outlined,
              color: page == "profile"
                  ? const Color(0xffEFA617)
                  : Theme.of(context).focusColor,
            ),
          ),
        ]),
      ),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutSine,
      height: showtAppbar ? 70 : 0,
    );
  }
}
