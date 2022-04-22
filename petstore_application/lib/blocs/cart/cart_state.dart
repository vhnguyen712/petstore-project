part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final Cart cart;

  CartUpdated({this.cart = const Cart()});

  @override
  // TODO: implement props
  List<Object> get props => [cart];
}
