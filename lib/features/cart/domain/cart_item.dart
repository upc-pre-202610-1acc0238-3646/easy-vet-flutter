class CartItem {
  final int productId;
  final String name;
  final double price;
  final String image;
  final String category;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.quantity,
  });
}