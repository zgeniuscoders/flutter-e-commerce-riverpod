import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/di/appModule.dart';
import 'package:yabiso_ecommerce/domain/services/ProductService.dart';
import 'package:yabiso_ecommerce/pages/home/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(const HomeState()) {
    getProducts();
  }

  final ProductService _productService = getIt<ProductService>();

  Future<void> getProducts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final products = await _productService.getProducts();
      state = state.copyWith(products: products, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(),
);
