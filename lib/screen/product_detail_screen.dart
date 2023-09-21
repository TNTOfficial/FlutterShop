import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // ProductDetailScreen(this.title, this.price);
  // final String title;
  // final double price;
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productsId = ModalRoute.of(context)?.settings.arguments as String;
    final loaededList =
        Provider.of<Products>(context, listen: false).findById(productsId);

    return Scaffold(
        appBar: AppBar(
          title: Text(loaededList.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  loaededList.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '\$ ${loaededList.price}',
                style: const TextStyle(color: Colors.grey, fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Text(
                  '${loaededList.description}',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ));
  }
}
