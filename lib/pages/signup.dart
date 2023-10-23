// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names

import 'package:Annekal/pages/home_page.dart';
import 'package:Annekal/pages/seller_home/listmani.dart';
import 'package:Annekal/widgets/gradienttext.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'login.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  bool check1 = false;
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        button_chech = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      if (seller.sellerreq == true) {
        // ignore: use_build_context_synchronously
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(
              namee: seller.sellername,
              seller: seller.sellerreq,
            ),
          ),
          // ignore: avoid_types_as_parameter_names
          (Route) => false,
        );
        listseller(
          sellername: seller.sellername,
        );
      } else {
        // ignore: use_build_context_synchronously
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(
              namee: seller.sellername,
              seller: seller.sellerreq,
            ),
          ),
          // ignore: avoid_types_as_parameter_names
          (Route) => false,
        );
      }
      setState(() {
        button_chech = false;
      });
    }
  }

  bool button_chech = false;

  bool check2 = false;

  String pass1 = "";

  String pass2 = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(color: context.canvasColor),
          toolbarHeight: 25,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
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
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15)),
                        color: Theme.of(context).cardColor,
                        gradient: LinearGradient(
                            colors: [
                              context.canvasColor,
                              Theme.of(context).indicatorColor
                            ],
                            end: Alignment.bottomLeft,
                            begin: Alignment.topCenter),
                      ),
                      child: VxBox(
                        child: Gradianttext(
                          gradient: LinearGradient(
                              colors: [
                                Theme.of(context).indicatorColor,
                                Vx.cyan400,
                              ],
                              end: Alignment.topRight,
                              begin: Alignment.bottomLeft),
                          text: 'ANNEKAL',
                          style: const TextStyle(
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
                          "Register YourShop",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).focusColor),
                        )
                      : Text(
                          "Register YourSelf",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).focusColor),
                        ),
                ).pOnly(left: 30, right: 30),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(children: [
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
                          ),
                        ),
                        hintText: !seller.sellerreq ? "Username" : "Sellername",
                        hintStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return !seller.sellerreq
                              ? "UserName can't be empty"
                              : "Seller name can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
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
                          ),
                        ),
                        hintText: "Contact no.",
                        hintStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Contact no can't be empty";
                        } else if (value.length < 10) {
                          return 'Enter a valid contact number';
                        }
                        return null;
                      },
                    ).pOnly(top: 15),
                    TextFormField(
                      obscureText: true,
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
                          ),
                        ),
                        hintText: "Enter Password",
                        hintStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return 'password must contain atleast six characters';
                        } else {
                          check1 = true;
                          pass1 = value;
                        }
                        return null;
                      },
                    ).pOnly(top: 15),
                    TextFormField(
                      obscureText: true,
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
                          ),
                        ),
                        hintText: "Re-Enter Password",
                        hintStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return 'password must contain atleast six characters';
                        } else {
                          check2 = true;
                          pass2 = value;
                        }
                        if (check1 == true && check2 == true) {
                          passvaidotor(pass1, pass2);
                        }
                        if (!checker.passwordcheck) {
                          return "Password Missmatch";
                        }
                        return null;
                      },
                    ).pOnly(top: 15),
                    const SizedBox(
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
                            borderRadius:
                                BorderRadius.circular(button_chech ? 50 : 15),
                            child: InkWell(
                              onTap: () => movetohome(context),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 600),
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
                                        "SignUp",
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
                              Navigator.pop(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(seconds: 0),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const login(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Already a Member? ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor),
                                  ),
                                ).expand(),
                                const Text(
                                  "Login ",
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
                  ]),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: VxArc(
          edge: VxEdge.top,
          arcType: VxArcType.convey,
          height: 0,
          child: InkWell(
            splashColor: Theme.of(context).indicatorColor,
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
                  ? "SignUp as Customer"
                      .text
                      .bold
                      .color(Theme.of(context).focusColor)
                      .center
                      .lg
                      .make()
                  : "SignUp as Seller"
                      .text
                      .bold
                      .color(Theme.of(context).focusColor)
                      .center
                      .lg
                      .make(),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class checker {
  static bool passwordcheck = false;
}

void passvaidotor(String pass1, String pass2) {
  // ignore: unnecessary_null_comparison
  if (pass1 == null || pass2 == null || pass1.isEmpty || pass2.isEmpty) {
    checker.passwordcheck = false;
  } else if (pass1 == pass2) {
    checker.passwordcheck = true;
  }
}
