import 'package:flutter/material.dart';
import 'package:vastrafy/screens/products_overview_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VastraFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        fontFamily: 'Lato',
      ),
      routes: {
        ProductDetailScreen.routeName:(ctx)=> ProductDetailScreen(),
        },
      home: ProductsOverviewScreen(),
    );
  }
}
