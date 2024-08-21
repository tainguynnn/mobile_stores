import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest/widgets/screen_title/page_title.dart';

import '../models/product.dart';
import '../widgets/list_item.dart';

class ProdList extends StatelessWidget {
  const ProdList({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomePage();
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageTitle(
            title: 'Products',
            subTitle: 'All available products in our store',
          ),
          FutureBuilder<List<Product>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While waiting for the future to complete
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If the future completes with an error
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                // If the future completes with data
                final products = snapshot.data!;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) => ListItem(
                        product: products[index],
                      ),
                    ),
                  ),
                );
              } else {
                // If the future completes but there is no data
                return const Text('No products found.');
              }
            },
          )
        ],
      ),
    );
  }

  List<Product> _parseProducts(String response) {
    // Parse the JSON response
    final Map<String, dynamic> jsonResponse = json.decode(response);

    // Extract the list of products from the "content" field
    final List<dynamic> productJsonList = jsonResponse['content'];

    // Map the JSON to a list of Product objects
    return productJsonList
        .map<Product>((json) => Product.fromJson(json))
        .toList();
  }

  Future<List<Product>> fetchProducts() async {
    // Define the base URL
    final baseUrl = Uri.parse('http://10.0.2.2:8080/api/v2/products');
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      return _parseProducts(response.body);
    }

    throw Exception('Failed to load Product');
  }
}
