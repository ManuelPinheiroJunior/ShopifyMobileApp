import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class HttpRequestError implements Exception {
  final String message;

  HttpRequestError(this.message);
}

class HttpError implements Exception {
  final String message;

  HttpError(this.message);
}

class MyShopifyApi {
  MyShopifyApi();

  final baseUrl = 'https://quickstart-b021611e.myshopify.com';
  final accessToken = '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';

  Future<List<dynamic>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/admin/products.json?access_token=$accessToken'),
      );
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('products')) {
          return jsonResponse['products'] as List<dynamic>;
        } else {
          throw HttpRequestError('Products key not found in JSON response.');
        }
      } else {
        throw HttpRequestError(
            'Failed to fetch products: ${response.statusCode}');
      }
    } on http.ClientException {
      throw HttpError('HTTP Client Exception');
    } on SocketException {
      throw HttpError('Socket Exception');
    }
  }
}
