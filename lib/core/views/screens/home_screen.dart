import 'package:flutter/material.dart';
import 'package:fully_integrated/core/view_models/products_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsVm>(
      create: (ctx) => ProductsVm()..getProductsFromServer(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
                padding: EdgeInsets.all(17),
                child: Badge(
                  label: Consumer<ProductsVm>(
                      builder: (ctx, pvm, child) =>
                          Text("${pvm.totalProduct}")),
                  child: Icon(Icons.shopping_cart),
                ))
          ],
        ),
        floatingActionButton: Consumer<ProductsVm>(
            builder: (ctx, r, child) => FloatingActionButton(onPressed: () {
                  r.addOne();
                })),
        body: Consumer<ProductsVm>(builder: (ctx, x, child) {
          if (x.allProducts.isEmpty) return Center(child: Text("Loading..."));
          return ListView.separated(
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: x.allProducts.length,
              itemBuilder: (ctx, index) {
                return SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.network(
                        x.allProducts[index].thumbnail,
                      ),
                      ListTile(
                        title: Text(x.allProducts[index].title),
                        subtitle: Text(x.allProducts[index].category),
                        trailing: Text("\$${x.allProducts[index].price}"),
                        leading: InkWell(
                          child: Icon(Icons.add_shopping_cart),
                          onTap: () {
                            x.addOne();
                          },
                        ),
                      )
                    ],
                  ),
                );
              });
        }),
      ),
    );
  }
}
