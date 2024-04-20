import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopper/models/product.dart';

class ServiceProduct {
  String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getProducts() async {
    List<Product> products = [];

    final response = await http.get(Uri.parse(baseUrl));

    try {
      if (response.statusCode == 200) {
        List responseData = await json.decode(response.body);
        products = responseData.map((data) => Product.fromJson(data)).toList();
      }
    } catch (error) {
      throw Exception(error);
    }
    return products;
  }
}
