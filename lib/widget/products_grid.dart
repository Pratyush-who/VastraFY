import 'package:flutter/material.dart';
import 'package:vastrafy/providers/products.dart';
import 'package:vastrafy/widget/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItem : productsData.items;
    return GridView.builder(
      itemCount: products.length,
      padding: EdgeInsets.all(7),
      // value wla se bubgs ni aate... agr ye main me kroge to aenge... ye sub branch jaisa h
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
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
