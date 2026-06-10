import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final CartItem item;
  const Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(item.image, width: 64, height: 64, fit: BoxFit.cover),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('\$${item.price.toStringAsFixed(2)}'),
                Text('Quantity: ${item.quantity}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
