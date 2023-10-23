// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:Annekal/models/filteredlist.dart';
import 'package:Annekal/pages/home_widgets/gridItem.dart';
import 'package:Annekal/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/models/cartmodel.dart';
import 'package:Annekal/models/model.dart';
import 'package:Annekal/pages/home_widgets/addtocart.dart';

class homedetail extends StatefulWidget {
  final Item grocery;

  const homedetail({super.key, required this.grocery});

  @override
  State<homedetail> createState() => _homedetailState();
}

class _homedetailState extends State<homedetail> {
  @override
  void initState() {
    super.initState();
    filter.searching(widget.grocery);
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: context.cardColor),
          backgroundColor: context.cardColor,
        ),
        backgroundColor: context.cardColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Hero(
                      tag: Key(widget.grocery.id.toString()),
                      child: Image.network(widget.grocery.image)
                          .box
                          .color(context.cardColor)
                          .roundedLg
                          .make())
                  .p32()
                  .h32(context),
              widget.grocery.name.text
                  .color(Theme.of(context).focusColor)
                  .xl3
                  .bold
                  .make(),
              widget.grocery.desc.text.xl
                  .color(Theme.of(context).focusColor)
                  .textStyle(context.captionStyle)
                  .make(),
              VxArc(
                height: 10.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.canvasColor,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: showthat.mainfiltersearch.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final grocerygrid = showthat.mainfiltersearch[index];
                      return Container(
                        padding: const EdgeInsets.all(0.0),
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        decoration: BoxDecoration(
                            color: context.cardColor,
                            border: Border.all(
                                color: Theme.of(context).indicatorColor,
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14.0))),
                        child: InkWell(
                          onTap: () {},
                          child: griditem(grocery: grocerygrid),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            // ignore: unrelated_type_equality_checks
                            (orientation == Orientation.portrait) ? 2 : 3,
                        childAspectRatio: 2 / 3),
                  ).p20(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: (widget.grocery.quantity == 0)
                  ? Text(
                      "₹${widget.grocery.price}",
                      style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.25,
                    )
                  : VxBuilder(
                      mutations: const {CounterMutation, RemoveMutation},
                      builder: (context, store, status) => Text(
                        "₹${widget.grocery.price * widget.grocery.quantity}",
                        style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1.25,
                      ),
                    ),
            ),
            AddtoCart(
              grocery: widget.grocery,
            ).w40(context).pOnly(right: 24)
          ],
        ),
      ),
    );
  }
}
