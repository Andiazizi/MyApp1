// To parse this JSON data, do
//
//     final myEat = myEatFromJson(jsonString);

import 'dart:convert';

List<MyEat> myEatFromJson(String str) => List<MyEat>.from(json.decode(str).map((x) => MyEat.fromJson(x)));

String myEatToJson(List<MyEat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyEat {
  MyEat({
    this.menuName,
    this.image,
  });

  String menuName;
  String image;

  factory MyEat.fromJson(Map<String, dynamic> json) => MyEat(
    menuName: json["menuName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "menuName": menuName,
    "image": image,
  };
}
