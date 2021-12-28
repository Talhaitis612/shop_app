import 'package:flutter/material.dart';
import '../providers/products.dart';
import './product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _productsData = Provider.of<Products>(context);
    final _products = _productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _products.length,
      itemBuilder: (ctx, index) => ProductItem(
        _products[index].id,
        _products[index].title,
        _products[index].imageUrl,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
