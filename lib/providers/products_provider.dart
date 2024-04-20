import 'package:flutter/material.dart';
import 'package:shopper/models/product.dart';
import 'package:shopper/services/service_product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> products = [];

  Future<List<Product>> getProductData() async {
    return await ServiceProduct().getProducts();
  }
}
