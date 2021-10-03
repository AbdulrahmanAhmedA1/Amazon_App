import 'package:flutter/material.dart';
import 'package:flutter_amazon/providers/products_provider.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:flutter_amazon/screens/category_screen.dart';
import 'package:flutter_amazon/screens/home_screen.dart';
import 'package:flutter_amazon/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => Provider2()),
      ],
      child: MaterialApp(
        
        theme: ThemeData(
            primaryIconTheme: IconThemeData(color: Colors.black),
            fontFamily: 'Amazon'),
        debugShowCheckedModeBanner: false,
        home: Home(),
        routes: {
          CategoryScreen.route: (context) => CategoryScreen(),
          ProductDetailsScreen.route: (context) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
