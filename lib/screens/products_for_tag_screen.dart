import 'package:flutter/material.dart';
import 'package:teste/componentes/products.dart';
import 'package:teste/model/model.dart';
import 'package:teste/services/repository_shopify_api.dart';
import 'package:teste/screens/error_screen.dart';

final MyShopifyRepository myShopifyRepository = MyShopifyRepository();

class ProductsForTagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tag = ModalRoute.of(context)!.settings.arguments as Tag;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products ${tag.name ?? 'No Name'}'),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<List<Product>>(
          future: myShopifyRepository.getProductsWithTag(tag.name!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              // Exiba os produtos na lista
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  if (index >= 0 && index < snapshot.data!.length) {
                    final product = snapshot.data![index];
                    return ProductsItem(product);
                  } else {
                    // Se o índice for inválido, retorne um widget indicando o erro
                    return ErrorScreen(
                      errorMessage:
                          'Error: Invalid index or no element at index $index',
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
