import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/models/product.dart';
import 'package:shopper/providers/category_provider.dart';
import 'package:shopper/providers/products_provider.dart';
import 'package:shopper/widgets/items_product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryProvider>(context).categories;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Products'),
      ),
      body: Center(
        child: Consumer<ProductsProvider>(
          builder: (ctx, provider, _) {
            return FutureBuilder(
              future: provider.getProductData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  List<Product> filteredProds = [];
                  final product = snapshot.data!;

                  for (var cats in category) {
                    filteredProds = product
                        .where((prods) => prods.category.contains(cats.name))
                        .toList();
                    print(cats.name);
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredProds.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return ItemsProduct(filteredProds[index]);
                    },
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
