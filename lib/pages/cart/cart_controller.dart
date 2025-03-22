import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/di/appModule.dart';
import 'package:yabiso_ecommerce/domain/models/cart.dart';
import 'package:yabiso_ecommerce/domain/services/cart_service.dart';
import 'package:yabiso_ecommerce/pages/cart/cart_state.dart';

class CartController extends StateNotifier<CartState> {
  final _cartService = getIt<CartService>();

  CartController() : super(CartState()) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    state = state.copyWith(isLoading: true);
    try {
      final cartItems = await _cartService.getCartItems();
      state = state.copyWith(cartItems: cartItems, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> removeItemFromCart(Cart item) async{
    final isRemoved = await _cartService.removeToCart(item);
  }

  Future<void> updateQty(int itemId, int qty) async{
    await _cartService.updateItemQty(itemId, qty);
  }
}

final cartControllerProvider = StateNotifierProvider<CartController, CartState>(
  (ref) => CartController(),
);
