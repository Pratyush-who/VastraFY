import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vastrafy/providers/cart.dart';
import 'package:vastrafy/providers/product.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int qty;

  CartItem(
    this.id,
    this.title,
    this.price,
    this.qty,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure'),
                  content: Text('to delete your super outfit?'),
                  actions: [
                    TextButton(onPressed: () {Navigator.of(ctx).pop(false);}, child: Text('No')),
                    TextButton(onPressed: () {Navigator.of(ctx).pop(true);}, child: Text('Yes')),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(id);
      },
      background: Container(
        color: Colors.amber,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Text('\$${price}'),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              'Total: \$${price * qty}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              '$qty X',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
