import 'package:yabiso_ecommerce/domain/models/cart.dart';

abstract class CartService {

  Future<bool> addToCart(Cart item);

  Future<bool> updateItemQty(int itemId, int qty);

  Future<bool> removeToCart(Cart item);

  Future<List<Cart>> getCartItems();

  Future<int> getTotalCartCount();

  Future<bool> clearCart();
}
