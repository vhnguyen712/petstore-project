import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:petstore_application/blocs/product_bloc.dart';
import 'package:petstore_application/data/models/product_model.dart';
import 'components/product_card.dart';

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
            return ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var product = snapshot.data?[index];
                return ProductCard(product: product);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black54,
            ),
          );
        },
      ),
    );
  }
}
