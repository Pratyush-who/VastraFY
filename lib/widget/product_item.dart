import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(onPressed: null, icon: Icon(Icons.favorite,color: Colors.white),),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(onPressed: null, icon: Icon(Icons.shopping_bag_outlined,color: Colors.white),),
      ),
    );
  }
}
