import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
}

Future<void> signUp(String email, String password) async {
  final url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDyeaS7DYfHNnQvQDd97U_7ZwZEXP-6ScQ");

  final response = await http.post(url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }));
}
