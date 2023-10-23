class Grocerymodel {
  // ignore: non_constant_identifier_names

  static List<Item> item = [];

  // static var item;
  //get item by id
  Item getById(int id) =>
      // ignore: null_closures, unrelated_type_equality_checks
      item.firstWhere((element) => element.id == id, orElse: null);
  //get by pos
  Item getByPosition(int pos) => item[pos];
}

class Item {
  final int id;
  final String sellername;
  final String name;
  final String desc;
  final int price;
  final int itemquantity;
  int quantity;
  final String image;

  Item({
    required this.id,
    required this.sellername,
    required this.name,
    required this.desc,
    required this.price,
    required this.itemquantity,
    required this.quantity,
    required this.image,
  });
  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
        id: map["id"],
        sellername: map["sellername"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        itemquantity: map["itemquantity"],
        quantity: map["quantity"],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "sellername": sellername,
        "name": name,
        "desc": desc,
        "price": price,
        "itemquatity": itemquantity,
        "quantity": quantity,
        "image": image,
      };
}
