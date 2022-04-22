part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class InitCart extends CartEvent {}

class AddToCart extends CartEvent {
  final Product product;

  const AddToCart(this.product);

  @override
  // TODO: implement props
  List<Object> get props => [product];

  @override
  String toString() => "$product";
}

class RemoveFromCart extends CartEvent {
  final Product product;

  const RemoveFromCart(this.product);

  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class RemoveItemFromCart extends CartEvent {
  final Product product;

  const RemoveItemFromCart(this.product);

  @override
  // TODO: implement props
  List<Object> get props => [product];
}
