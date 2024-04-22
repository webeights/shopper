import 'package:flutter/material.dart';
import 'package:shopper/models/product.dart';

class FilteredProductsProvider with ChangeNotifier {
  List<Product> filteredProducts = [];

  Future<List<Product>> getProducts() async {
    return filteredProducts;
  }
}
