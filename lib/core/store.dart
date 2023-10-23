// ignore_for_file: depend_on_referenced_packages

import 'package:Annekal/models/cartmodel.dart';
import 'package:Annekal/models/model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  Grocerymodel? grocery;
  List<Item>? productnum;
  Cartmodel? cart;
  int? sum;
  int? counter;
  MyStore() {
    grocery = Grocerymodel();
    cart = Cartmodel();
    sum = 0;
    productnum = Grocerymodel.item;
    cart?.grocery = grocery!;
  }
}
