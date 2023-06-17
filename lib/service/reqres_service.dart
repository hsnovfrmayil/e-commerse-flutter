import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../constant/reqres_url.dart';
import '../model/reqres_model.dart';
import '../model/reqres_post_model.dart';
import '../model/reqres_user_model.dart';

class ReqresService {
  final String getReqresUrl = "$reqresUrl/users?page=2";
  Future<ReqresModel?> reqresMethod() async {
    var response = await http.get(Uri.parse(getReqresUrl));
    try {
      if (response.statusCode == 200) {
        var result = ReqresModel.fromJson(jsonDecode(response.body));
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class ReqresPostService {
  final String reqresPostUrl = "$reqresUrl/login";
  Future<ReqresPostModel?> reqresPostMethod(var email, var password) async {
    ReqresPostModel reqresPost =
        ReqresPostModel(email: email, password: password);
    final response = await Dio()
        .post(reqresPostUrl, data: reqresPostModelToJson(reqresPost));
    if (response.statusCode == 200) {
      print("success");
    } else {
      print(response.statusCode);
    }
  }
}

class ReqresUserService {
  final String getReqresUser = "$reqresUrl/users?page=2";
  Future<ReqresUser?> reqresUserMethod() async {
    var response = await http.get(Uri.parse(getReqresUser));
    try {
      if (response.statusCode == 200) {
        var result = ReqresUser.fromJson(jsonDecode(response.body));
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
