// ignore_for_file: camel_case_types, avoid_types_as_parameter_names, prefer_collection_literals

import 'package:Annekal/models/filteredlist.dart';
import 'package:Annekal/models/model.dart';

class filter {
  static void filteringseller() {
    var seen = Set<String>();
    showthat.filterlistresultforseller = showthat.filterlistresultforseller
        .where(
          (seller) => seen.add(seller.sellername),
        )
        .toList();
  }

  static void searching(Item grocery) {
    var seen = Set<String>();
    showthat.mainfiltersearch = Grocerymodel.item
        .where((things) =>
            things.name.toLowerCase().contains(grocery.name.toLowerCase())
                ? seen.add(things.sellername)
                : false)
        .toList();
  }
}

class Data {
  final String seller;
  final String name;

  Data({required this.seller, required this.name});
}
