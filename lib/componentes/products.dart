import 'package:flutter/material.dart';
import 'package:teste/model/product.dart';
import 'package:teste/utlis/app_routes.dart';

class ProductsItem extends StatelessWidget {
  final Product products;

  const ProductsItem(this.products, {Key? key}) : super(key: key);

  void _selectProduct(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.productDetail,
      arguments: products,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectProduct(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    products.images!.first.src.toString(),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      products.title.toString(),
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      products.status == 'active'
                          ? const Icon(Icons.done_all_outlined,
                              color: Colors.green)
                          : const Icon(Icons.error_outline, color: Colors.red),
                      const SizedBox(width: 6),
                      Text('${products.status}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.inventory_2_outlined,
                          color: Colors.brown),
                      const SizedBox(width: 6),
                      Text(
                        products.variants!.first.inventoryQuantity.toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money,
                          color: Colors.yellowAccent),
                      const SizedBox(width: 6),
                      Text(products.variants!.first.price.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
