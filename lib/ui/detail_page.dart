import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoran/provider/restaurant_provider.dart';
import 'package:restoran/provider/favorite_provider.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<RestaurantProvider>().fetchDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Restoran")),
      body: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          if (state.isLoading)
            return const Center(child: CircularProgressIndicator());
          if (state.message.isNotEmpty)
            return Center(child: Text(state.message));

          final res = state.restaurantDetail;
          if (res == null) return const SizedBox();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: res.pictureId,
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/large/${res.pictureId}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        res.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Expanded(child: Text("${res.city}, ${res.address}")),
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            res.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Text(res.description),
                      const SizedBox(height: 20),
                      const Text(
                        "Menu Makanan:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      _buildMenuList(res.foods, Icons.restaurant),
                      const SizedBox(height: 20),
                      const Text(
                        "Menu Minuman:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      _buildMenuList(res.drinks, Icons.local_drink),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Consumer<RestaurantProvider>(
        builder: (context, restaurantState, _) {
          final res = restaurantState.restaurantDetail;
          if (res == null) return const SizedBox();

          return Consumer<FavoriteProvider>(
            builder: (context, favoriteProvider, _) {
              return FutureBuilder<bool>(
                future: favoriteProvider.isFavorited(res.id),
                builder: (context, snapshot) {
                  bool isFavorited = snapshot.data ?? false;
                  return FloatingActionButton(
                    backgroundColor: Colors.orange,
                    child: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      if (isFavorited) {
                        favoriteProvider.removeFavorite(res.id);
                      } else {
                        favoriteProvider.addFavorite(res);
                      }
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMenuList(List<String> items, IconData icon) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => Container(
          width: 140,
          margin: const EdgeInsets.only(right: 12),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.orange, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    items[index],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
