import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vastrafy/providers/cart.dart';
import 'package:vastrafy/providers/product.dart';
import 'package:vastrafy/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id, product.title, product.price);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'You just selected a cool item!',
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'Undo',
                      backgroundColor: Colors.deepOrange,
                      onPressed: () {
                        cart.removeItem(product.id);
                      }),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
