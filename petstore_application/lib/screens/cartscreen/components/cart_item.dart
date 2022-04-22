import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore_application/blocs/cart/cart_bloc.dart';
import 'package:petstore_application/data/models/product_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 110,
        padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image ?? ""),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? "null",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Total: ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ((product.price! * quantity).toStringAsFixed(2)) +
                            "\$",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(RemoveFromCart(product));
                        },
                        icon: Icon(
                          Icons.remove,
                          size: 20,
                        )),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(AddToCart(product));
                      },
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 40,
                height: 40,
                child: Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                BlocProvider.of<CartBloc>(context)
                    .add(RemoveItemFromCart(product));
              },
            ),
          ],
        ),
      ),
    );
  }
}
