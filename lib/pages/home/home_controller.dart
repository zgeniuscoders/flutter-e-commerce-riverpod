import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/di/appModule.dart';
import 'package:yabiso_ecommerce/domain/models/cart.dart';
import 'package:yabiso_ecommerce/domain/models/product.dart';
import 'package:yabiso_ecommerce/domain/services/ProductService.dart';
import 'package:yabiso_ecommerce/domain/services/cart_service.dart';
import 'package:yabiso_ecommerce/pages/home/home_state.dart';
import 'package:yabiso_ecommerce/pages/shared_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final ProductService _productService = getIt<ProductService>();
  final CartService _cartService = getIt<CartService>();

  HomeController() : super(const HomeState()) {
    getTotalCartItems();
    getProducts();
  }

  Future<void> getProducts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final products = await _productService.getProducts();
      state = state.copyWith(products: products, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> getTotalCartItems() async {
    await _cartService.getTotalCartCount();
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(),
);
