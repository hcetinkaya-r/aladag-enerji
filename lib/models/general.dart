import 'dart:convert';

import 'package:aladag_enerji/models/activity_area.dart';
import 'package:aladag_enerji/models/web_user.dart';
import 'package:meta/meta.dart';

General welcomeFromJson(String str) => General.fromJson(json.decode(str));

String welcomeToJson(General data) => json.encode(data.toJson());

class General {
  General({
    @required this.webUsers,
    @required this.projects,
    @required this.activityAreas,
    @required this.references,
  });

  final List<WebUser>? webUsers;
  final List<ActivityArea>? projects;
  final List<ActivityArea>? activityAreas;
  final List<ActivityArea>? references;

  factory General.fromJson(Map<String, dynamic> json) => General(
        webUsers: json["webUsers"] == null
            ? null
            : List<WebUser>.from(
                json["webUsers"].map((x) => WebUser.fromJson(x))),
        projects: json["projects"] == null
            ? null
            : List<ActivityArea>.from(
                json["projects"].map((x) => ActivityArea.fromJson(x))),
        activityAreas: json["activityAreas"] == null
            ? null
            : List<ActivityArea>.from(
                json["activityAreas"].map((x) => ActivityArea.fromJson(x))),
        references: json["references"] == null
            ? null
            : List<ActivityArea>.from(
                json["references"].map((x) => ActivityArea.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "webUsers": webUsers == null
            ? null
            : List<dynamic>.from(webUsers!.map((x) => x.toJson())),
        "projects": projects == null
            ? null
            : List<dynamic>.from(projects!.map((x) => x.toJson())),
        "activityAreas": activityAreas == null
            ? null
            : List<dynamic>.from(activityAreas!.map((x) => x.toJson())),
        "references": references == null
            ? null
            : List<dynamic>.from(references!.map((x) => x.toJson())),
      };
}
