import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fully_integrated/core/constants/api_url.dart';
import 'package:fully_integrated/core/helpers/http_helper.dart';
import 'package:fully_integrated/core/models/category.dart';

class CategoriesVM extends ChangeNotifier {
  HttpHelper hh = HttpHelper.instance;
  List<Category> allCategories = [];

  Future<void> getCategoriesFromServer() async {
    Response<dynamic> res = await hh.get(url: ApiUrl.CATROUTE);
    List<dynamic> cats = res.data;
    allCategories = cats.map((item) => Category.fromJson(item)).toList();

    notifyListeners();
  
  }
}
