import 'package:flutter/material.dart';

class Reference {
  Reference({
    @required this.id,
    @required this.projectId,
    @required this.name,
    @required this.image,
  });

  final int? id;
  final int? projectId;
  final String? name;
  final String? image;

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        id: json["id"] == null ? null : json["id"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "projectId": projectId == null ? null : projectId,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
      };
}
