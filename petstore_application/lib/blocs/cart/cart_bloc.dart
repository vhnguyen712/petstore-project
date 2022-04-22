import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petstore_application/data/models/cart_model.dart';
import 'package:petstore_application/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<InitCart>(_onInitCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<RemoveItemFromCart>(_onRemoveItem);
  }

  void _onInitCart(
    InitCart event,
    Emitter<CartState> emit,
  ) {
    emit(CartUpdated(cart: Cart()));
  }

  void _onAddToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) {
    if (this.state is CartUpdated) {
      print("alo");
      emit(CartUpdated(
          cart: Cart(
              products: List.from((this.state as CartUpdated).cart.products)
                ..add(event.product))));
    } else {
      emit(CartUpdated());
    }
  }

  void _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) {
    emit(CartUpdated(
        cart: Cart(
            products: List.from((this.state as CartUpdated).cart.products)
              ..remove(event.product))));
  }

  void _onRemoveItem(
    RemoveItemFromCart event,
    Emitter<CartState> emit,
  ) {
    emit(CartUpdated(
        cart: Cart(
            products: List.from((this.state as CartUpdated).cart.products)
              ..removeWhere((item) => item == event.product))));
  }
}
