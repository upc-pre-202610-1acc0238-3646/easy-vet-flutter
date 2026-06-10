import 'package:easy_vet/features/cart/data/cart_service.dart';
import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:easy_vet/features/cart/domain/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService service;
  const CartRepositoryImpl({required this.service});

  @override
  Future<void> addToCart(int productId, int quantity) async {
    await service.addToCart(productId, quantity);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final dtos = await service.getCartItems();
    return dtos.map((item) => item.toDomain()).toList();
  }

  @override
  Future<void> removeFromCart(int productId) async {
    await service.addToCart(productId, 0);
  }

  @override
  Future<void> updateCartItem(int productId, int quantity) {
    // TODO: implement updateCartItem
    throw UnimplementedError();
  }
}
