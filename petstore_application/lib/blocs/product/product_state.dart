part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> products;

  ProductsLoaded({this.products = const <Product>[]});
}
