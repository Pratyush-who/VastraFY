import 'package:flutter/material.dart';
import 'package:vastrafy/screens/products_overview_screen.dart';
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
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
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
        },
        home: ProductsOverviewScreen(),
      ),
    );
  }
}
