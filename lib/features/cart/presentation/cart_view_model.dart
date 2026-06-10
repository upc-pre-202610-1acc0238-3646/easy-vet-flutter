import 'package:easy_vet/features/cart/domain/cart_repository.dart';
import 'package:easy_vet/features/cart/presentation/cart_state.dart';
import 'package:flutter/widgets.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository repository;
  CartState state = const CartState();

  CartViewModel({required this.repository}) {
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    try {
      final items = await repository.getCartItems();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
    notifyListeners();
  }

  Future<void> addToCart(int productId, int quantity) async {
    try {
      await repository.addToCart(productId, quantity);
      await loadCartItems();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      notifyListeners();
    }
  }
}
