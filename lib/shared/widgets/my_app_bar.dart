import 'package:flutter/material.dart';
import 'package:fully_integrated/core/view_models/products_vm.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
   MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text('Mo Store',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.brown.shade800)),
        backgroundColor: Colors.amber.shade50,
        elevation: 4,
        shadowColor: Colors.amber.withOpacity(0.3),
        actions: [
          Consumer<ProductsVm>(
            builder: (ctx, pvm, child) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/cart_view'),
                child: Badge(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 28,
                    color: Colors.brown.shade800,
                  ),
                  label: Consumer<ProductsVm>(
                    builder: (ctx, pvm, child) => Text(
                      "${pvm.cartItems.length}",
                      style: TextStyle(
                          fontSize: 12, color: Colors.brown.shade800),
                    ),
                  ),
                  backgroundColor: Colors.amber,
                  textColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}