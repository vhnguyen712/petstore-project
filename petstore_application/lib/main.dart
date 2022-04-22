import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore_application/blocs/cart/cart_bloc.dart';
import 'package:petstore_application/blocs/product/product_bloc.dart';
import 'package:petstore_application/data/repositories/product_repository.dart';
import 'package:petstore_application/data/services/product_service.dart';
import 'package:petstore_application/screens/homescreen/home_screen.dart';

void main() {
  runApp(const MyApp());
  // ProductService().fetchAllProducts().then((value) => print(value));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
              productRepository: ProductRepository(service: ProductService()))
            ..add(
              LoadProducts(),
            ),
        ),
        BlocProvider(create: (context) => CartBloc()..add(InitCart()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pet Store',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.orange,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
