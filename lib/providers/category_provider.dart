import 'package:flutter/material.dart';
import 'package:shopper/models/category.dart';
import 'package:shopper/services/services.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categories = [];

  Future<List<Category>> getProductCategories() async {
    categories = await Services().getCategories();
    return categories;
  }
}
