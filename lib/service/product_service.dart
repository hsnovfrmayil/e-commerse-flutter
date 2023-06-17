import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant/product_url.dart';
import '../model/product_model.dart';

class ProductService {
  final String getProductUrl = "$apiUrl/products";
  Future<ProductModel?> getProductMethod() async {
    var response = await http.get(Uri.parse(getProductUrl));

    try {
      if (response.statusCode == 200) {
        var result = ProductModel.fromJson(jsonDecode(response.body));
        return result;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
