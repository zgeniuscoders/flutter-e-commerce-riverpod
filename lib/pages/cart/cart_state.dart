import 'package:equatable/equatable.dart';
import 'package:yabiso_ecommerce/domain/models/cart.dart';

class CartState extends Equatable {
  final String? errorMessage;
  final bool isLoading;
  final List<Cart> cartItems;

  const CartState({
    this.isLoading = false,
    this.cartItems = const [],
    this.errorMessage = null,
  });

  CartState copyWith({
    String? errorMessage,
    bool? isLoading,
    List<Cart>? cartItems,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, cartItems, errorMessage];
}
