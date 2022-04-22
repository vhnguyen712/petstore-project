import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore_application/blocs/cart/cart_bloc.dart';
import 'package:petstore_application/data/models/cart_model.dart';
import 'package:petstore_application/data/models/product_model.dart';
import 'package:petstore_application/screens/cartscreen/components/check_out_sheet.dart';
import 'package:petstore_application/screens/homescreen/components/product_card.dart';

import 'components/cart_item.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: const Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black54,
              ),
            );
          }
          if (state is CartUpdated) {
            Map cartItems = state.cart.productQuantity(state.cart.products);
            return cartItems.length != 0
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 100),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      Product product = cartItems.keys.elementAt(index);
                      int quantity = cartItems[product];
                      return CartItem(product: product, quantity: quantity);
                    },
                  )
                : Center(child: Text("Your cart is empty."));
          } else
            return Center(
              child: Text("Something went wrong"),
            );
        },
      ),
      bottomSheet: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated && state.cart.products.length != 0)
            return CheckOutSheet(cart: state.cart);
          else
            return Visibility(
              child: Text("null"),
              visible: false,
            );
        },
      ),
    );
  }
}
