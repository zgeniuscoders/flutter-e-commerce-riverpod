import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/di/appModule.dart';
import 'package:yabiso_ecommerce/domain/services/ProductService.dart';
import 'package:yabiso_ecommerce/domain/services/cart_service.dart';
import 'package:yabiso_ecommerce/pages/product_detail/product_detail_state.dart';

import '../../domain/models/cart.dart';
import '../../domain/models/product.dart';
import '../shared_state.dart';

class ProductDetailController extends StateNotifier<ProductDetailState> {
  final ProductService _productService = getIt<ProductService>();
  final CartService _cartService = getIt<CartService>();
  final Ref _ref;

  ProductDetailController(this._ref) : super(ProductDetailState());

  Future<void> getTotalCartItems() async {
    final totalItems = await _cartService.getTotalCartCount();
    final currentShareState = _ref.read(sharedStateProvider);
    _ref.read(sharedStateProvider.notifier).state = currentShareState.copyWith(
      totalItems: totalItems,
    );
  }

  Future<void> getProduct(int productId) async {
    state = state.copyWith(isLoading: true);
    try {
      final product = await _productService.getProduct(productId);
      state = state.copyWith(isLoading: false, product: product);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> addToCart(Product product) async {
    var item = Cart(
      productId: product.id!,
      productName: product.name!,
      productPhoto: product.photo!,
      productPrice: product.price!,
      qty: 1,
    );

    await _cartService.addToCart(item);

    getTotalCartItems();
  }
}

final productDetailControllerProvider =
    StateNotifierProvider<ProductDetailController, ProductDetailState>(
      (ref) => ProductDetailController(ref),
    );
