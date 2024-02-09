// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String id;
  String vehiclename;
  String vehiclenumber;
  String vehicleType;
  String vehicleprice;
  int v;

  Posts({
    required this.id,
    required this.vehiclename,
    required this.vehiclenumber,
    required this.vehicleType,
    required this.vehicleprice,
    required this.v,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json["_id"],
    vehiclename: json["vehiclename"],
    vehiclenumber: json["vehiclenumber"],
    vehicleType: json["vehicleType"],
    vehicleprice: json["vehicleprice"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "vehiclename": vehiclename,
    "vehiclenumber": vehiclenumber,
    "vehicleType": vehicleType,
    "vehicleprice": vehicleprice,
    "__v": v,
  };
}
