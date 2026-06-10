import 'package:easy_vet/features/cart/presentation/cart_state.dart';
import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartViewModel viewModel = context.watch<CartViewModel>();
    final CartState state = viewModel.state;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(child: Text('${state.errorMessage}'));
    }

    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final item = state.items[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
          trailing: Text('x${item.quantity}'),
        );
      },
    );
  }
}
