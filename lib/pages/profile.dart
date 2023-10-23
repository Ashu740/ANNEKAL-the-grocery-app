// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last, camel_case_types, depend_on_referenced_packages, no_logic_in_create_state, unused_field, prefer_final_fields

import 'dart:convert';

import 'package:Annekal/widgets/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/models/all_detail.dart';
import 'package:Annekal/pages/profile_details/userdetail.dart';
import 'package:Annekal/widgets/appbar.dart';

class profile extends StatefulWidget {
  final bool seller;

  const profile({super.key, required this.seller});
  @override
  State<profile> createState() => _profileState(seller: seller);
}

class _profileState extends State<profile> {
  ScrollController _scrollController = ScrollController();
  final bool seller;

  _profileState({required this.seller});
  userloadData() async {
    var userdetailjson =
        await rootBundle.loadString("assest/files/userdetail.json");
    var userdecodedData = jsonDecode(userdetailjson);
    var userproductData = userdecodedData["userdetailss"];
    UserDetail.userid = List.from(userproductData)
        .map<Detail>((userid) => Detail.fromMap(userid))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userloadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const Sappbar(
              title: "Me",
            ),
            const CircleAvatar(
              backgroundColor: Vx.gray200,
              radius: 70,
            ).w32(context),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: UserDetail.userid.length,
                itemBuilder: (context, index) {
                  final me = UserDetail.userid[index];
                  return userdetail(user: me);
                },
              ),
            )
          ]),
        ),
        bottomNavigationBar: Bottombar(
          page: "profile",
          scrollController: _scrollController,
        ),
      ),
    );
  }
}
