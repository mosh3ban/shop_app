import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/268%20auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Auth()),
          ChangeNotifierProvider.value(value: ProductsProvider()),
          ChangeNotifierProvider.value(value: Cart()),
          ChangeNotifierProvider.value(value: Orders()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "My Shop",
          home: AuthScreen(),
          theme: ThemeData(
              primaryColor: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
              textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
          routes: {
            CartSceen.routeName: (_) => CartSceen(),
            OrdersScreen.routeName: (_) => OrdersScreen(),
            UserProductScreen.routeName: (_) => UserProductScreen(),
            EditProductScreen.routeName: (_) => EditProductScreen(""),
          },
        ));
  }
}
