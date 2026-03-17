import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restoran/data/model/restaurant.dart';

class RestaurantProvider extends ChangeNotifier {
  // Tambahkan variabel client
  final http.Client client;
  final String _baseUrl = 'https://restaurant-api.dicoding.dev';

  // Tambahkan constructor untuk Dependency Injection
  RestaurantProvider({http.Client? client}) : client = client ?? http.Client();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _message = "";
  String get message => _message;

  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;

  RestaurantDetail? _restaurantDetail;
  RestaurantDetail? get restaurantDetail => _restaurantDetail;

  Future<void> fetchAllRestaurants() async {
    try {
      _isLoading = true;
      _message = "";
      notifyListeners();

      // PERUBAHAN: Gunakan client.get (milik variabel), bukan http.get (global)
      final response = await client.get(Uri.parse("$_baseUrl/list"));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body)['restaurants'];
        _restaurants = data.map((json) => Restaurant.fromJson(json)).toList();
      } else {
        _message =
            "Gagal memuat daftar restoran. Silakan coba beberapa saat lagi.";
      }
    } on SocketException {
      _message =
          "Tidak ada koneksi internet. Pastikan Wi-Fi atau data seluler Anda aktif.";
    } catch (e) {
      _message =
          "Terjadi kesalahan saat mengambil data. Periksa koneksi Anda dan coba lagi.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDetail(String id) async {
    try {
      _isLoading = true;
      _message = "";
      _restaurantDetail = null;
      notifyListeners();

      // PERUBAHAN: Gunakan client.get
      final response = await client.get(Uri.parse("$_baseUrl/detail/$id"));

      if (response.statusCode == 200) {
        _restaurantDetail = RestaurantDetail.fromJson(
          json.decode(response.body)['restaurant'],
        );
      } else {
        _message = "Informasi detail tidak ditemukan.";
      }
    } on SocketException {
      _message = "Gagal memuat detail. Koneksi internet terputus.";
    } catch (e) {
      _message = "Maaf, terjadi kesalahan sistem. Silakan kembali nanti.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
