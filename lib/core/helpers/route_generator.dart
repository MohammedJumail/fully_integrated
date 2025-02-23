import 'package:flutter/material.dart';
import 'package:fully_integrated/core/views/screens/cart_screen.dart';
import 'package:fully_integrated/core/views/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/home_view':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());

      case '/cart_view':
        return MaterialPageRoute(builder: (ctx) => CartScreen());
      default:
        return null;
    }
  }
}
