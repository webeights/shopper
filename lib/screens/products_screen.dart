import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/models/category.dart';
import 'package:shopper/providers/products_provider.dart';
import 'package:shopper/widgets/items_product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const routeName = '/products_screen';

  @override
  Widget build(BuildContext context) {
    var routeArgs = ModalRoute.of(context)!.settings.arguments as Category;
    final category = routeArgs.name;

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
                  final prods = snapshot.data;

                  final filteredProducts = prods!
                      .where((prod) => prod.category.contains(category))
                      .toList();
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return ItemsProduct(filteredProducts[index]);
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
