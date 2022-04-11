import 'package:flutter/material.dart';
import 'package:petstore_application/blocs/product_bloc.dart';
import 'package:petstore_application/data/models/product_model.dart';
import 'package:petstore_application/data/repositories/product_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productBloc = ProductBloc();

  @override
  void initState() {
    // TODO: implement initState
    productBloc.eventSink.add(ProductEvent.fetch);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    productBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: const Text(
          "Pet Store",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: productBloc.productStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var product = snapshot.data?[index];
                return Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text("name: " + (product?.name ?? "null")),
                      Text("quantity: " +
                          (product?.quantity.toString() ?? "null")),
                      Text("price: " +
                          (product?.price?.toStringAsFixed(2) ?? "null")),
                    ],
                  ),
                );
              },
            );
          }
          return Center(
            child: Text("No product found."),
          );
        },
      ),
    );
  }
}
