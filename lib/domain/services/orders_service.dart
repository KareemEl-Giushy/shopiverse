import 'dart:convert';

import 'package:shopiverse/core/const.dart';
import 'package:shopiverse/domain/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shopiverse/domain/services/auth_service.dart';

class OrdersService {
  static const String _ordersUrl = "$api/order/orders";
  static const String _confirmUrl = "$api/order/confirm-order";

  Future<List<OrderModel>> getAllOrders() async {
    final uri = Uri.parse(_ordersUrl);
    final token = await AuthService().getToken();

    List<OrderModel> orders = [];
    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Host': uri.host,
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        for (Map<String, dynamic> d in data) {
          OrderModel o = OrderModel.fromJson(d);

          // List<ProductModel> ps = [];
          // for (Map<String, dynamic> p in data["products"]) {
          //   ps.add(ProductModel.fromJson(p));
          // }

          // o.products = ps;

          orders.add(o);
        }
      } else {
        print('loading orders failed: ${response.body}');
      }
    } catch (e) {
      print('Error during loading orders: $e');
    }
    return orders;
  }

  Future<bool> confirmOrder(String otp) async {
    final uri = Uri.parse(_confirmUrl);
    final body = jsonEncode({"otp": otp});

    final token = await AuthService().getToken();

    try {
      final response = await http.patch(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Host': uri.host,
          'Content-Length': body.length.toString(),
          'Authorization': "Bearer $token",
        },
        body: body,
      );
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        return true;
      } else {
        print('confirming failed: ${response.body}');
      }
    } catch (e) {
      print('Error during Confirming: $e');
    }

    return false;
  }
}
