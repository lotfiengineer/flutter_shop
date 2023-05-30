import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:store_api_flutter_course/services/product.dart';


Future<Product> fetchProducts() async {
  final response = await http
      .get(Uri.parse('https://fakestoreapi.com/products/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Product.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}