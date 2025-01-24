import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int qty;
  CartItem(this.id, this.title, this.price, this.qty);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Text('\$${price}'),
          ),
          title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,),),
          subtitle: Text('Total: \$${price * qty}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,),),
          trailing: Text('$qty X',style: TextStyle(fontSize:19,fontWeight: FontWeight.w600,),),
        ),
      ),
    );
  }
}