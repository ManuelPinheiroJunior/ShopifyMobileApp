import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:teste/screens/error_screen.dart';
import 'package:teste/screens/products_details_screen.dart';
import 'package:teste/screens/products_for_tag_screen.dart';
import 'package:teste/screens/tags_screen.dart';
import 'package:teste/utlis/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tag List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        routes: {
          AppRoutes.home: (ctx) => const TagsScreen(),
          AppRoutes.productsforTags: (ctx) => ProductsForTagScreen(),
          AppRoutes.productDetail: (ctx) => const ProductDetailScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) {
              return ErrorScreen(
                errorMessage: "Route not found: '${settings.name}'.",
              );
            },
          );
        });
  }
}
