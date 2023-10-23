// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:Annekal/pages/seller_home/listmani.dart';
import 'package:Annekal/pages/signup.dart';
import 'package:Annekal/widgets/gradienttext.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";
import '../utils/routes.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  // ignore: non_constant_identifier_names
  bool button_chech = false;
  ScrollController scrollController = ScrollController();
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        button_chech = true;
      });
      await Future.delayed(Duration(seconds: 1));
      if (seller.sellerreq == true) {
        await Navigator.pushReplacementNamed(context, Myroutes.homeroute);
        listseller(sellername: seller.sellername);
      } else {
        await Navigator.pushReplacementNamed(context, Myroutes.homeroute);
      }
      setState(() {
        button_chech = false;
      });
    }
  }

  @override
  void initState() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(50.0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(color: context.canvasColor),
        toolbarHeight: 25,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          child: Container(
            color: context.canvasColor,
            child: Form(
              key: _formkey,
              child: Column(
                // ignore: duplicate_ignore
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                                "assest/imagess/undraw_Shopping_Bags_v82b-removebg-preview.png",
                                fit: BoxFit.cover)
                            .pOnly(top: 40),
                      ).pOnly(bottom: 20),
                      Container(
                        alignment: Alignment.bottomLeft,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15)),
                          color: Theme.of(context).cardColor,
                          gradient: LinearGradient(
                              colors: [
                                context.canvasColor,
                                Theme.of(context).indicatorColor
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight),
                        ),
                        child: VxBox(
                          child: Gradianttext(
                            gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).indicatorColor,
                                  Vx.blue400,
                                ],
                                end: Alignment.topRight,
                                begin: Alignment.bottomLeft),
                            text: 'ANNEKAL',
                            style: TextStyle(
                                fontSize: 15, overflow: TextOverflow.fade),
                          ).p12(),
                        ).color(context.canvasColor).roundedSM.make().p12(),
                      ).expand(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: seller.sellerreq
                        ? Text(
                            "HELLO Seller ${seller.sellername}",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).focusColor),
                          )
                        : Text(
                            "HELLO ${seller.sellername}",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).focusColor),
                          ),
                  ).pOnly(left: 30, right: 30),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Theme.of(context).focusColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).dividerColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).indicatorColor),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                )),
                            hintText:
                                !seller.sellerreq ? "Username" : "Sellername",
                            // labelText: "username",

                            hintStyle:
                                TextStyle(color: Theme.of(context).hintColor),
                            // labelStyle: TextStyle(
                            //     color: Theme.of(context).focusColor)
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return !seller.sellerreq
                                  ? "user name cannot be empty"
                                  : "seller name cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            seller.sellername = value;
                            setState(() {});
                          },
                        ).pOnly(bottom: 4),
                        TextFormField(
                          style: TextStyle(color: Theme.of(context).focusColor),
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).dividerColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).indicatorColor),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Theme.of(context).dividerColor),
                            ),
                            hintText: "Password",
                            hintStyle:
                                TextStyle(color: Theme.of(context).hintColor),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password must have atleast 6 characters";
                            }
                            return null;
                          },
                        ).pOnly(top: 16),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: context.cardColor,
                              borderRadius: BorderRadius.circular(23)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Material(
                                color: Theme.of(context).indicatorColor,
                                borderRadius: BorderRadius.circular(
                                    button_chech ? 50 : 15),
                                child: InkWell(
                                  onTap: () => movetohome(context),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    width: button_chech ? 50 : 150,
                                    height: 50,
                                    alignment: Alignment.center,
                                    // ignore: sort_child_properties_last
                                    child: button_chech
                                        ? Icon(
                                            Icons.done,
                                            color: context.cardColor,
                                          )
                                        : Text(
                                            "Login",
                                            style: TextStyle(
                                              color: context.cardColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                  ),
                                ),
                              ).pOnly(right: 12),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            signup(),
                                      ));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "New To Annekal? ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        style: TextStyle(
                                            color: Theme.of(context).hintColor),
                                      ),
                                    ).expand(),
                                    const Text(
                                      "SignUp ",
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      softWrap: false,
                                      style: TextStyle(color: Vx.red500),
                                    ),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ).p12(),
                        ).pOnly(top: 12, bottom: 20),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context).hintColor),
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.topLeft,
                            height: 55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assest/imagess/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                                ).h48(context).p12(),
                                "  Continue with Google"
                                    .text
                                    .color(Theme.of(context).hintColor)
                                    .center
                                    .lg
                                    .overflow(TextOverflow.ellipsis)
                                    .make()
                                    .pOnly(left: 30),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: VxArc(
        edge: VxEdge.top,
        arcType: VxArcType.convex,
        height: 0,
        child: InkWell(
          overlayColor: MaterialStateProperty.all(context.cardColor),
          onTap: () {
            // Future.delayed(Duration(seconds: 2));
            seller.sellerreq = !seller.sellerreq;
            setState(() {});
          },
          child: Container(
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.cardColor,
            ),
            child: seller.sellerreq
                ? "Login as Customer"
                    .text
                    .bold
                    .color(Theme.of(context).focusColor)
                    .center
                    .lg
                    .make()
                : "Login as Seller"
                    .text
                    .bold
                    .color(Theme.of(context).focusColor)
                    .center
                    .lg
                    .make(),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class seller {
  static bool sellerreq = false;
  static String sellername = "";
}
