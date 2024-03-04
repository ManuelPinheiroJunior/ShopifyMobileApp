import 'package:flutter/material.dart';
import 'package:teste/model/model.dart' as myModel;

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 330,
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as myModel.Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title.toString()),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.images!.first.src.toString(),
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Product Details'),
            _createSectionContainer(
              ListView.builder(
                itemCount: product.variants!.length,
                itemBuilder: (ctx, index) {
                  final variant = product.variants![index];
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Number Register: ${variant.id.toString()}'),
                          Text('Name Product: ${product.title.toString()}'),
                          Text('Price: R\$ ${variant.price.toString()}'),
                          Text('tags: ${product.tags.toString()}'),
                          Text(
                              'Date Register: ${product.createdAt.toString()}'),
                          Text(
                              'Stock: ${variant.inventoryQuantity.toString()}'),
                          Text('Status: ${product.status.toString()}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
