import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/food.dart';


class DataServices {
  String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<List<Food>> getInfo() async {
    http.Response response = await http.get(Uri.parse('http://192.168.0.145:8000/api/foods'));
    if (kDebugMode) {
        print(response.body);
      }

    List<Food> foods = [];

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        if (kDebugMode) {
          print(list);
        }
        foods = list.map((e) => Food.fromJson(e)).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return foods;
  }

  Future<Food> getInfoInDetail(int id) async {
    var apiUrl = 'foods/$id/';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    Food food=Food();

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> foodMap = json.decode(response.body);
        food=Food.fromJson(foodMap);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error because serveur');
      }
    }
    return food;
  }
}