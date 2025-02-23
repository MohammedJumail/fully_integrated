import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fully_integrated/core/constants/api_url.dart';
import 'package:fully_integrated/core/helpers/http_helper.dart';
import 'package:fully_integrated/core/models/cart.dart';
import 'package:fully_integrated/core/models/product.dart';

class ProductsVm extends ChangeNotifier {
  HttpHelper hh = HttpHelper.instance;
  int totalProduct = 0;

  List<Product> allProducts = [];
  List<CartItem> cartItems = [];

  addCartItem(Product product) {
     final existingIndex = cartItems.indexWhere((item) => item.product.id == product.id);
    
    if (existingIndex != -1) {
      // Product exists - increment quantity
      cartItems[existingIndex] = cartItems[existingIndex].copyWith(
        quantity: cartItems[existingIndex].quantity + 1
      );
    } else {
      // New product - add to cart
      cartItems.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void getProductsFromServer() async {
    Response res = await hh.get(url: ApiUrl.PRODUCTROUTE);
    List<dynamic> allProducts = res.data["products"];
    this.allProducts = allProducts.map((i) => Product.fromAPI(i)).toList();

    notifyListeners();
  }

  getSingleProductDetails(int id) {
    HttpHelper hh = HttpHelper.instance;
    hh.get(url: "${ApiUrl.PRODUCTROUTE}/$id");
  }
}
