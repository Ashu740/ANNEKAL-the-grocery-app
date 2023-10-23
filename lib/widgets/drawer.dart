// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final myimage = "assest/imagess/Screenshot 2022-12-15 214459.jpg";
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.deepOrange),
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Ashutosh kumar"),
                accountEmail: Text("ashutosh15945gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(myimage),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Contact us",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
