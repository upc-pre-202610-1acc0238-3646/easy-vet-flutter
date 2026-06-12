import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';
import 'package:easy_vet/features/home/presentation/home_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductRepository repository;

  HomeViewModel({required this.repository}) {
    loadProducts();
  }

  HomeState state = HomeState();

  Future<void> loadProducts() async {
    //await repository.syncProducts();
    state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      List<Product> products = await repository.getProducts();
      state = state.copyWith(products: products, isLoading: false);

    } catch (e) {
      String errorMessage = 'Failed to load products: $e';
      state = state.copyWith(errorMessage: errorMessage, isLoading: false);
    }
    notifyListeners();

  }

}
