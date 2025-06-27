import 'dart:convert';

import 'package:shopiverse/core/const.dart';
import 'package:shopiverse/domain/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shopiverse/domain/services/auth_service.dart';

class OrdersService {
  static const String _pendingOrdersUrl = "$api/order/pending-orders";
  static const String _deliveredOrdersUrl = "$api/order/delivered-orders";
  static const String _confirmUrl = "$api/order/confirm-order";

  Future<List<OrderModel>> getPendingOrders() async {
    final uri = Uri.parse(_pendingOrdersUrl);
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

  Future<List<OrderModel>> getDeliveredOrders() async {
    final uri = Uri.parse(_deliveredOrdersUrl);
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
