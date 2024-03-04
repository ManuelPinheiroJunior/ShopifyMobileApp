import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste/model/model.dart';
import 'package:teste/screens/products_for_tag_screen.dart';
import 'package:teste/utlis/app_routes.dart';

class TagItem extends StatelessWidget {
  final Tag tag;

  const TagItem(this.tag);

  void _selectTag(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.productsforTags, arguments: tag);
  }

  @override
  Widget build(BuildContext context) {
    // Gere valores aleatórios para os componentes de cor
    final random = Random();
    final randomColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    return InkWell(
        onTap: () => _selectTag(context),
        splashColor: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                randomColor.withOpacity(0.5),
                randomColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(tag.name ?? 'No Name'),
        ));
  }
}
