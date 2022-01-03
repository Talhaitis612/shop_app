import 'package:flutter/material.dart';
import '../providers/products.dart';
import './product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final _productsData = Provider.of<Products>(context);

    final _products =
        showFavs ? _productsData.favoriteItems : _productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: _products[index],
        child: ProductItem(),
      ),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
