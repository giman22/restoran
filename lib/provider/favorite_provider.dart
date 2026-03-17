import 'package:flutter/material.dart';
import 'package:restoran/data/db/database_helper.dart';
import 'package:restoran/data/model/restaurant.dart';

class FavoriteProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  FavoriteProvider({required this.databaseHelper}) {
    fetchAllFavorites();
  }

  List<Restaurant> _favorites = [];
  List<Restaurant> get favorites => _favorites;

  Future<void> fetchAllFavorites() async {
    _favorites = await databaseHelper.getFavorites();
    notifyListeners();
  }

  Future<void> addFavorite(Restaurant restaurant) async {
    await databaseHelper.insertFavorite(restaurant);
    await fetchAllFavorites();
  }

  Future<void> removeFavorite(String id) async {
    await databaseHelper.removeFavorite(id);
    await fetchAllFavorites();
  }

  Future<bool> isFavorited(String id) async {
    final favoriteRestaurant = await databaseHelper.getFavoriteById(id);
    return favoriteRestaurant.isNotEmpty;
  }
}
