import 'package:flutter/material.dart';
import 'package:vastrafy/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello,Pratyush..!!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamed('/OrdersScreen');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.paypal_outlined),
            title: Text('Payment'),
            onTap: () {
              Navigator.of(context).pushNamed('/OrdersScreen');
            },
          ),
        ],
      ),
    );
  }
}
