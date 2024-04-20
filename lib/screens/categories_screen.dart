import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/providers/products_provider.dart';
import 'package:shopper/widgets/items_product.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Categories'),
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
                  final product = snapshot.data!;
                  return GridView.builder(
                    itemCount: product.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) =>
                        ItermsProduct(product[index]),
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
