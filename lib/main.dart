import 'package:flutter/material.dart';
import 'package:vastrafy/providers/cart.dart';
import 'package:vastrafy/providers/orders.dart';
import 'package:vastrafy/screens/cart_screen.dart';
import 'package:vastrafy/screens/edit_product_screen.dart';
import 'package:vastrafy/screens/orders_screen.dart';
import 'package:vastrafy/screens/products_overview_screen.dart';
import 'package:vastrafy/screens/user_product_screen.dart';
import 'screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'providers/products.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VastraFY',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductScreen.routeName:(ctx)=> UserProductScreen(),
          EditProductScreen.routeName:(ctx)=> EditProductScreen(),
        },
        home: ProductsOverviewScreen(),
      ),
    );
  }
}