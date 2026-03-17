import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/restaurant.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<List<Restaurant>> getList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return (json.decode(response.body)['restaurants'] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList();
    }
    throw Exception('Gagal memuat daftar');
  }

  Future<List<Restaurant>> search(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$query"));
    if (response.statusCode == 200) {
      return (json.decode(response.body)['restaurants'] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList();
    }
    throw Exception('Gagal mencari');
  }

  Future<RestaurantDetail> getDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(
        json.decode(response.body)['restaurant'],
      );
    }
    throw Exception('Gagal memuat detail');
  }
}
