import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:users/models/user_model.dart';

class UserProvider with ChangeNotifier {
  // function for api call

  List<User> users = [];

  Future<void> getUserData() async {
    try {
      Dio dio = Dio();

      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users');

      var responseJson = response.data;
      debugPrint(responseJson.toString());

      if (response.statusCode == 200) {
        users =
            (response.data as List).map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
