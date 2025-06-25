import 'dart:convert';

import 'package:shopiverse/core/const.dart';
import 'package:shopiverse/domain/models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:shopiverse/domain/services/auth_service.dart';

class DeliveryProfile {
  static const String _profileUrl = "$api/user/delivery-profile";

  Future<dynamic> getProfile() async {
    final uri = Uri.parse(_profileUrl);
    final token = await AuthService().getToken();
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
        return ProfileModel.fromJson(data["data"]["user"]);
      } else {
        print('Loading failed: ${response.body}');
      }
    } catch (e) {
      print('Error during loading: $e');
    }

    return false;
  }
}
