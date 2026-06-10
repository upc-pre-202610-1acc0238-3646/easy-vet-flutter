import 'package:easy_vet/features/cart/domain/cart_item.dart';

abstract class CartRepository {
  Future<void> addToCart(int productId, int quantity);
  Future<void> removeFromCart(int productId);
  Future<void> updateCartItem(int productId, int quantity);
  Future<List<CartItem>> getCartItems();
}