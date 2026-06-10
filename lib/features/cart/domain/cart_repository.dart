import 'package:easy_vet/features/cart/domain/cart_item.dart';

abstract class CartRepository {
  Future<void> addToCart(String productId, int quantity);
  Future<void> removeFromCart(String productId);
  Future<void> updateCartItem(String productId, int quantity);
  Future<List<CartItem>> getCartItems();
}