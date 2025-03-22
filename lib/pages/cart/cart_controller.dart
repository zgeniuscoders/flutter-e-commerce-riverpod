import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/pages/cart/cart_state.dart';

class CartController extends StateNotifier<CartState> {
  CartController() : super(CartState()) {
    getCartItems();
  }

  Future<void> getCartItems() async {}
}
