import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void _setFaveValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleIsFavorite(String? token, String? userId) async {
    var oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        "https://shop-7b8f0-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$token");
    try {
      final response = await http.patch(
        url,
        body: json.encode({'isFavorite': isFavorite}),
      );
      if (response.statusCode >= 400) {
        _setFaveValue(oldStatus);
      }
    } catch (error) {
      _setFaveValue(oldStatus);
    }
  }
}
