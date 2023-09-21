import 'package:flutter/material.dart';
import 'package:flutter_shoping_app/providers/cart.dart';
import 'package:flutter_shoping_app/providers/orders.dart';
import 'package:flutter_shoping_app/screen/cart_screen.dart';
import 'package:flutter_shoping_app/screen/edit_product_screen.dart';
import 'package:flutter_shoping_app/screen/order_screen.dart';
import 'package:flutter_shoping_app/screen/product_detail_screen.dart';
import 'package:flutter_shoping_app/screen/user_products_screen.dart';

import './screen/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import 'login/sign_up_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            canvasColor: Colors.deepOrange,
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(error: Colors.red)),
        home: const SignUpScreen(),
        routes: {
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => const EditProductScreen(),
        },
      ),
    );
  }
}
