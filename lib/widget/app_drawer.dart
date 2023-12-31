import 'package:flutter/material.dart';

import '../screen/order_screen.dart';
import '../screen/products_overview_screen.dart';
import '../screen/user_products_screen.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello frinds'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            title: const Text('Shop'),
            leading: const Icon(Icons.shop),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Order'),
            leading: const Icon(Icons.payment),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Manege Products'),
            leading: const Icon(Icons.edit),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
