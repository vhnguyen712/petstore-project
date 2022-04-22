import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:petstore_application/data/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  double get total => products.fold(
      0, (total, current) => total + (current.price ?? 0 as double));

  @override
  // TODO: implement props
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }
}
