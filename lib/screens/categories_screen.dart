import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/models/category.dart';
import 'package:shopper/providers/category_provider.dart';
import 'package:shopper/screens/products_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const routeName = '/categories_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, value, _) => FutureBuilder(
          future: value.getProductCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              final category = snapshot.data!;
              return GridView(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                children: [
                  ...category.map(
                    (data) => Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            ProductsScreen.routeName,
                            arguments: Category(name: data.name),
                          );
                          print(data.name);
                        },
                        child: Center(
                          child: Text(data.name),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
