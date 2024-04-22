import 'package:flutter/material.dart';
import 'package:shopper/models/product.dart';
import 'package:shopper/services/services.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> products = [];

  Future<List<Product>> getProductData() async {
    products = await Services().getProducts();
    return products;
  }
}
