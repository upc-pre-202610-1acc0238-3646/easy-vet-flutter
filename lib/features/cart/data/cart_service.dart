import 'dart:convert';
import 'dart:io';

import 'package:easy_vet/core/storage/token_storage.dart';
import 'package:easy_vet/features/cart/data/cart_item_dto.dart';
import 'package:http/http.dart' as http;

class CartService {

  final TokenStorage storage;

  const CartService({required this.storage});

  final String _baseUrl =
      'https://petapi-591531460223.us-central1.run.app/api/cart';

      Future<List<CartItemDto>> getCartItems() async {
        final Uri uri = Uri.parse(_baseUrl);

        final String? token = await storage.getToken();

        if (token == null) {
          throw Exception('Token not found');
        }

        final http.Response response = await http.get(uri,headers:{
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

        if(response.statusCode == HttpStatus.ok) {
          final json = jsonDecode(response.body);
          final items = json['results'];
          return items.map((item) => CartItemDto.fromJson(item)).toList();
        } else {
          throw Exception('Failed to load cart items');
        }
      }

}