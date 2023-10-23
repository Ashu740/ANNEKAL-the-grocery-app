// ignore_for_file: depend_on_referenced_packages, must_be_immutable, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/models/all_detail.dart';
import 'package:Annekal/pages/login.dart';

// ignore: camel_case_types
class userdetail extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  final Detail user;

  userdetail({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: user.name.text.xl
                    .color(Theme.of(context).focusColor)
                    .make()
                    .p20(),
              ),
              InkWell(
                child: user.address.text.xl
                    .color(Theme.of(context).focusColor)
                    .make()
                    .p20(),
              ),
              InkWell(
                splashColor: context.canvasColor,
                onTap: () {
                  // Future.delayed(Duration(seconds: 2));
                  seller.sellerreq = !seller.sellerreq;
                  seller.sellername = "";
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const login(),
                    ),
                    (route) => false,
                  );
                },
                child: !seller.sellerreq
                    ? user.seller.text.xl
                        .color(Theme.of(context).focusColor)
                        .make()
                        .p20()
                    : "Switch to consumer"
                        .text
                        .xl
                        .color(Theme.of(context).focusColor)
                        .make()
                        .p20(),
              ),
              InkWell(
                child: user.refer.text.xl
                    .color(Theme.of(context).focusColor)
                    .make()
                    .p20(),
              ),
              InkWell(
                child: user.about.text.xl
                    .color(Theme.of(context).focusColor)
                    .make()
                    .p20(),
              ),
              InkWell(
                onTap: () {
                  seller.sellername = "";
                  if (scrollController.hasClients)
                    scrollController.jumpTo(50.0);
                  // Navigator.of(context).popUntil((route) {
                  //   if (route.settings.name != "/login") return false;
                  //   return true;
                  // });
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const login(),
                    ),
                    (route) => false,
                  );
                },
                child: user.logout.text.xl
                    .color(Theme.of(context).focusColor)
                    .make()
                    .p20(),
              ),
            ]),
      ),
    ).color(context.cardColor).roundedLg.make().py12().p20();
  }
}
