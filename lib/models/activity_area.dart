import 'package:flutter/material.dart';

class ActivityArea {
  ActivityArea({
    @required this.id,
    @required this.name,
    @required this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  factory ActivityArea.fromJson(Map<String, dynamic> json) => ActivityArea(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
      };
}
