import 'package:easy_vet/features/cart/data/cart_service.dart';
import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:easy_vet/features/cart/domain/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService service;
  const CartRepositoryImpl({required this.service});

  @override
  Future<void> addToCart(String productId, int quantity) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final dtos = await service.getCartItems();
    return dtos.map((item) => item.toDomain()).toList();
  }

  @override
  Future<void> removeFromCart(String productId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<void> updateCartItem(String productId, int quantity) {
    // TODO: implement updateCartItem
    throw UnimplementedError();
  }
}
