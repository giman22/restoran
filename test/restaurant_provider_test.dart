import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:restoran/provider/restaurant_provider.dart';
import 'dart:convert';

import 'restaurant_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late RestaurantProvider restaurantProvider;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    restaurantProvider = RestaurantProvider(client: mockClient);
  });

  group('Restaurant Provider Test', () {
    test(
      'Memastikan state awal provider harus didefinisikan (isLoading: false, restaurants: empty)',
      () {
        expect(restaurantProvider.isLoading, false);
        expect(restaurantProvider.restaurants.isEmpty, true);
        expect(restaurantProvider.message, "");
      },
    );

    test(
      'Memastikan mengembalikan daftar restoran ketika pengambilan data API berhasil',
      () async {
        when(
          mockClient.get(Uri.parse("https://restaurant-api.dicoding.dev/list")),
        ).thenAnswer(
          (_) async => http.Response(
            json.encode({
              "error": false,
              "message": "success",
              "count": 1,
              "restaurants": [
                {
                  "id": "1",
                  "name": "Resto Giman",
                  "description": "Deskripsi",
                  "pictureId": "01",
                  "city": "Subang",
                  "rating": 5.0,
                },
              ],
            }),
            200,
          ),
        );

        await restaurantProvider.fetchAllRestaurants();

        expect(restaurantProvider.isLoading, false);
        expect(restaurantProvider.restaurants.isNotEmpty, true);
        expect(restaurantProvider.restaurants[0].name, "Resto Giman");
      },
    );

    test(
      'Memastikan mengembalikan pesan kesalahan ketika pengambilan data API gagal',
      () async {
        when(
          mockClient.get(Uri.parse("https://restaurant-api.dicoding.dev/list")),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        await restaurantProvider.fetchAllRestaurants();

        expect(restaurantProvider.isLoading, false);
        expect(restaurantProvider.restaurants.isEmpty, true);
        expect(restaurantProvider.message.isNotEmpty, true);
      },
    );
  });
}
