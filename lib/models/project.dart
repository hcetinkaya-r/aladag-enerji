import 'package:flutter/material.dart';

class Project {
  Project({
    @required this.id,
    @required this.activityAreaId,
    @required this.name,
    @required this.image,
  });

  final int? id;
  final int? activityAreaId;
  final String? name;
  final String? image;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"] == null ? null : json["id"],
        activityAreaId:
            json["activityAreaId"] == null ? null : json["activityAreaId"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "activityAreaId": activityAreaId == null ? null : activityAreaId,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
      };
}
