import 'package:yabiso_ecommerce/domain/models/cart.dart';
import 'package:yabiso_ecommerce/domain/services/cart_service.dart';

class LocalCartServiceImpl extends CartService{

  List<Cart> cartItems = [
    Cart(
      productId: 1,
      productName: "Apple Watch",
      productPrice: 200.0,
      qty: 1,
      productPhoto: "assets/images/products/watch.jpg",
    )
  ];

  @override
  Future<bool> clearCart() {
    cartItems = [];
    return Future.value(true);
  }

  @override
  Future<List<Cart>> getCartItems() {
    return Future.value(cartItems);
  }

  @override
  Future<int> getTotalCartCount() {
    return Future.value(cartItems.length);
  }

  @override
  Future<bool> addToCart(Cart item) {
    cartItems.add(item);
    return Future.value(true);
  }

  @override
  Future<bool> removeToCart(Cart item) {
    // TODO: implement removeToCart
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItemQty(int itemId, int qty) {
    // TODO: implement updateItemQty
    throw UnimplementedError();
  }

}