// ignore_for_file: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';
import 'package:Annekal/core/store.dart';
import 'package:Annekal/models/model.dart';

class Cartmodel {
  Grocerymodel? _grocery;
  final List<int> _itemIds = [];

  // ignore: prefer_typing_uninitialized_variables
  var count;
  Grocerymodel get grocery => _grocery!;
//=grocery
  set grocery(Grocerymodel newGrocery) {
    // ignore: unnecessary_nularison, unnecessary_null_comparison
    assert(newGrocery != null);
    _grocery = newGrocery;
  }

  List<Item> get item => _itemIds.map((id) => _grocery!.getById(id)).toList();

  num get totalPrize => item.fold(
      0, (total, current) => total + (current.price * current.quantity));
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation({required this.item});
  @override
  perform() {
    store?.cart?._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  final Item index;

  RemoveMutation({required this.index, required this.item});
  @override
  perform() {
    if (index.quantity > 0) {
      index.quantity--;
    }
    if (index.quantity == 0) {
      store?.cart?._itemIds.remove(item.id);
    }
  }
}

// ignore: camel_case_types
class counter {
  // ignore: prefer_typing_uninitialized_variables
  static num? count = 0;
  static num? fincount = 0;
}

// ignore: no_leading_underscores_for_local_identifiers
listcounter(num _index) {
  counter.fincount = _index;
}

class CounterMutation extends VxMutation<MyStore> {
  final Item index;

  CounterMutation({required this.index});
  @override
  perform() {
    int c = 0;

    index.itemquantity > index.quantity
        ? index.quantity = index.quantity + 1
        : index.quantity = index.itemquantity;
    c++;

    listcounter(c);
  }
}
