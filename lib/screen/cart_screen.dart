import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import '../widget/cart_items.dart';
import 'order_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\₹${cart.totalAmount} ',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium
                              ?.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context , listen: false).addOrder(
                          cart.item.values.toList(), cart.totalAmount);
                      cart.clear();
                      Navigator.of(context).pushNamed(OrderScreen.routeName);
                    },
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, i) => CartItems(
                      cart.item.values.toList()[i].quantity,
                      cart.item.values.toList()[i].price,
                      cart.item.values.toList()[i].title,
                      cart.item.values.toList()[i].id,
                      cart.item.keys.toList()[i],
                    )),
          ),
        ],
      ),
    );
  }
}
