import 'package:flutter/material.dart';
import 'package:petstore_application/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 100,
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
                  image: NetworkImage(product?.image ?? ""),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.name ?? "null",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text((product?.price?.toStringAsFixed(2) ?? "null") + "\$"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          size: 20,
                        )),
                    Text(
                      "1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(),
                borderRadius: BorderRadius.circular(25),
              ),
              width: 40,
              height: 40,
              child: Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
