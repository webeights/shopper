class APIEndpoints {
  late String products;
  late String categories;

  APIEndpoints() {
    const String baseUrl = 'https://fakestoreapi.com';

    products = '$baseUrl/products';
    categories = '$baseUrl/products/categories';
  }
}
