import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/providers/category_provider.dart';
import 'package:shopper/providers/products_provider.dart';
import 'package:shopper/screens/categories_screen.dart';
import 'package:shopper/screens/products_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: CategoriesScreen.routeName,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        ProductsScreen.routeName: (context) => const ProductsScreen(),
      },
    );
  }
}
