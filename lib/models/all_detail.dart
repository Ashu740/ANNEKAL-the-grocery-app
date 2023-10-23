class UserDetail {
  static List<Detail> userid = [];
}

// ignore: empty_constructor_bodies
class Detail {
  final String name;
  final String address;
  final String seller;
  final String refer;
  final String about;
  final String logout;
  Detail({
    required this.name,
    required this.address,
    required this.seller,
    required this.refer,
    required this.about,
    required this.logout,
  });
  factory Detail.fromMap(Map<String, dynamic> map) {
    return Detail(
        name: map["name"]!,
        address: map["address"]!,
        seller: map["seller"]!,
        refer: map["refer"]!,
        about: map["about"]!,
        logout: map["logout"]!);
  }
  toMap() => {
        "address": address,
        "name": name,
        "refer": refer,
        "seller": seller,
        "about": about,
        "logout": logout,
      };
}
