import 'package:flutter/material.dart';
import 'package:fully_integrated/core/view_models/products_vm.dart';
import 'package:fully_integrated/shared/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Consumer<ProductsVm>(
            builder: (ctx, pvm, child) => ListView.builder(
                itemCount: pvm.cartItems.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: [
                        Expanded(child: Image.network(pvm.allProducts[index].thumbnail),flex: 1,),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(pvm.allProducts[index].title),
                                Text("\$${pvm.allProducts[index].price}")
                              ],
                            ),
                          )),
                        Expanded(
                          flex: 1,
                          child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Add Button
                              Container(
                                width: 40,
                                height: 40,
                                //margin: const EdgeInsets.only(right: 8),
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add, size: 20),
                                  color: Colors.white,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              
                              // Quantity Display
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Qty',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "${pvm.cartItems[index].quantity}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              
                              // Remove Button
                              Container(
                                width: 40,
                                height: 40,
                              //  margin: const EdgeInsets.only(left: 8),
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove, size: 20),
                                  color: Colors.white,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          )
                  )]));
                })),
      ),
    );
  }
}
