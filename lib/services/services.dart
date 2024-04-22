import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopper/models/category.dart';
import 'package:shopper/models/product.dart';
import 'package:shopper/services/api_endpoints.dart';

class Services {
  // String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getProducts() async {
    List<Product> products = [];

    final response = await http.get(Uri.parse(APIEndpoints().products));

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

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse(APIEndpoints().categories));
    final List responseData = json.decode(response.body);

    List<Category> categories = [];

    for (var data in responseData) {
      categories.add(Category(name: data));
    }
    return categories;
  }
}
