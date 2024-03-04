import 'package:flutter/material.dart';
import 'package:teste/componentes/tags_item.dart';
import 'package:teste/model/model.dart';
import 'package:teste/services/repository_shopify_api.dart';
import 'package:teste/componentes/main_drawer.dart';

final MyShopifyRepository myShopifyRepository = MyShopifyRepository();

class TagsScreen extends StatelessWidget {
  const TagsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tag List'),
      ),
      drawer: MainDrawer(),
      body: Container(
        color: Colors.white, // Defina a cor de fundo como branca
        child: FutureBuilder<List<Tag>>(
          // Utilize o método getTags do repositório para obter as tags
          future: myShopifyRepository.getTags(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              // Exiba as tags na grade
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final tag = snapshot.data![index];
                  return TagItem(tag);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
