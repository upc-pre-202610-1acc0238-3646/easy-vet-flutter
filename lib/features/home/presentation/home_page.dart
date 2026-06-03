import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:easy_vet/features/home/presentation/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    if (viewModel.state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.state.errorMessage != null) {
      return Center(child: Text(viewModel.state.errorMessage!));
    }

    return ListView.builder(
      itemCount: viewModel.state.products.length,
      itemBuilder: (context, index) =>
          ProductItem(product: viewModel.state.products[index]),
    );
  }
}
