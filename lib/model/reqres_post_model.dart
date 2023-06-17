// To parse this JSON data, do
//
//     final reqresPostModel = reqresPostModelFromJson(jsonString);

import 'dart:convert';

ReqresPostModel reqresPostModelFromJson(String str) =>
    ReqresPostModel.fromJson(json.decode(str));

String reqresPostModelToJson(ReqresPostModel data) =>
    json.encode(data.toJson());

class ReqresPostModel {
  String email;
  String password;

  ReqresPostModel({
    required this.email,
    required this.password,
  });

  factory ReqresPostModel.fromJson(Map<String, dynamic> json) =>
      ReqresPostModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
