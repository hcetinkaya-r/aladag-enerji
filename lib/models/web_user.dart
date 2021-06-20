import 'package:flutter/material.dart';

class WebUser {
  WebUser({
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
    @required this.email,
  });

  WebUser.withId(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});

  WebUser.withoutInfo();

  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  factory WebUser.fromJson(Map<String, dynamic> json) => WebUser.withId(
        id: json["id"] == null ? null : json["id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
      };
}
