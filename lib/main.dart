import 'package:flutter/material.dart';
import 'package:fully_integrated/core/view_models/products_vm.dart';
import 'package:fully_integrated/core/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<ProductsVm>(
      create: (ctx) => ProductsVm()..getProductsFromServer())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

