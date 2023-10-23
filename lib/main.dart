// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'package:Annekal/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/core/store.dart';
import 'package:Annekal/pages/cart.dart';
import 'package:Annekal/pages/home_page.dart';
import 'package:Annekal/pages/instant.dart';
import 'package:Annekal/pages/login.dart';
import 'package:Annekal/pages/profile.dart';
import 'package:Annekal/pages/search.dart';
import 'package:Annekal/utils/routes.dart';
import 'package:Annekal/widgets/themes.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Homepage(),
      themeMode: ThemeMode.system,
      theme: Mytheme.lighttheme(context),
      darkTheme: Mytheme.darktheme(context),
      initialRoute: "/login",
      routes: {
        Myroutes.loginroute: (context) => login(),
        Myroutes.homeroute: (context) => Homepage(
              seller: seller.sellerreq,
              namee: seller.sellername,
            ),
        Myroutes.cartroute: (context) => mycart(),
        Myroutes.searchroute: (context) => searching(),
        Myroutes.instantroute: (context) => instantSaves(),
        Myroutes.profileroute: (context) => profile(
              seller: seller.sellerreq,
            ),
        Myroutes.signroute: (context) => signup(),
      },
    ); //3:20:29
  }
}
