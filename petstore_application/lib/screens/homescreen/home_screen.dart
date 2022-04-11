import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore_application/blocs/product/product_bloc.dart';
import 'package:petstore_application/data/models/product_model.dart';
import 'package:petstore_application/data/repositories/product_repository.dart';
import 'package:petstore_application/data/services/product_service.dart';
import 'components/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productBloc = ProductBloc(
      productRepository: ProductRepository(service: ProductService()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black54,
              ),
            );
          }
          if (state is ProductsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                var product = state.products[index];
                return ProductCard(product: product);
              },
            );
          } else
            return Center(
              child: Text("Something went wrong"),
            );
        },
      ),
    );
  }
}
