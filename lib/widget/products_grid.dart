import 'package:flutter/material.dart';
import 'package:vastrafy/providers/products.dart';
import 'package:vastrafy/widget/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      itemCount: products.length,
      padding: EdgeInsets.all(7),
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (ctx)=> products[i],
        child: ProductItem(
        // products[i].id,
        // products[i].title,
        // products[i].imageUrl,
        // since i m providing single prod we dont have to receive our prod data as args here
      ),
      ),
      // how an item should be build
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      // no of cols basically
    );
  }
}
