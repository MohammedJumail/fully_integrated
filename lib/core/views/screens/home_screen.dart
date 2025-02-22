import 'package:flutter/material.dart';
import 'package:fully_integrated/core/view_models/categories_vm.dart';
import 'package:fully_integrated/core/view_models/products_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Product Store', style: TextStyle(fontWeight: FontWeight.bold)),
    backgroundColor: Colors.amber.shade50,
    elevation: 4,
    shadowColor: Colors.amber.withOpacity(0.3),
    actions: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Badge(
          child: Icon(Icons.shopping_cart, size: 28),
          label: Consumer<ProductsVm>(
            builder: (ctx, pvm, child) => Text(
              "${pvm.totalProduct}",
              style: TextStyle(fontSize: 12),
            ),
          ),
          backgroundColor: Colors.amber,
          textColor: Colors.black,
        ),
      ),
    ],
  ),
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories Section
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8),
            child: Text('Categories', 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ChangeNotifierProvider<CategoriesVM>(
            create: (ctx) => CategoriesVM()..getCategoriesFromServer(),
            child: Consumer<CategoriesVM>(
              builder: (ctx, cvm, child) {
                if (cvm.allCategories.isEmpty) {
                  return Center(child: CircularProgressIndicator(color: Colors.amber));
                }
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cvm.allCategories.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.amber.withOpacity(0.2),
                          child: Text(
                            cvm.allCategories[index].name!,
                            style: TextStyle(
                              color: Colors.brown.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Products Section
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text('Featured Products', 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ChangeNotifierProvider<ProductsVm>(
            create: (ctx) => ProductsVm()..getProductsFromServer(),
            child: Consumer<ProductsVm>(
              builder: (ctx, pvm, child) {
                if (pvm.allProducts.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(color: Colors.amber),
                        const SizedBox(height: 8),
                        Text('Loading products...', 
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pvm.allProducts.length,
                  itemBuilder: (ctx, index) {
                    final product = pvm.allProducts[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15)),
                            child: Image.network(
                              product.thumbnail,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: Colors.amber.shade100,
                                child: IconButton(
                                  icon: Icon(Icons.add_shopping_cart, 
                                      size: 20,
                                      color: Colors.brown.shade800),
                                  onPressed: () {},
                                ),
                              ),
                              title: Text(product.title!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 4),
                                  Text(product.category!,
                                      style: TextStyle(
                                          color: Colors.grey.shade600)),
                                  const SizedBox(height: 8),
                                ],
                              ),
                              trailing: Text(
                                '\$${product.price!.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown.shade800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
}
