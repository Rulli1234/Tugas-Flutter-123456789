import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_3/tugaas15/api/endpoint/endpoint.dart';
import 'package:ppkd_b_3/tugaas15/model/profile_model.dart';
import 'package:ppkd_b_3/tugaas15/preference/shared_preference.dart';

class ProfileService {
  static Future<ProfileModel> getProfile() async {
    final url = Uri.parse(Endpoint.profile);
    final token = await PreferenceHandler.getToken();

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);
      return ProfileModel.fromJson(json);
    } else {
      throw Exception(
        "Gagal Mengambil Data (${response.statusCode}): ${response.body}",
      );
    }
  }

  static Future<ProfileModel> updateData({
    required String name,
    required String email,
  }) async {
    final url = Uri.parse(Endpoint.profile);
    final token = await PreferenceHandler.getToken();

    final bodyMap = {"name": name, "email": email};

    final response = await http.put(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(bodyMap),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isNotEmpty) {
        try {
          final json = jsonDecode(response.body);
          return ProfileModel.fromJson(json);
        } catch (_) {}
      } else {
        return await getProfile();
      }
    } else {
      throw Exception(
        "Gagal Update (${response.statusCode}): ${response.body}",
      );
    }
    // If none of the above conditions are met, throw an exception
    throw Exception("Unknown error occurred in updateData");
  }
}
