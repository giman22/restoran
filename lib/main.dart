import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import 'package:restoran/data/db/database_helper.dart';
import 'package:restoran/data/preferences/preferences_helper.dart';
import 'package:restoran/provider/restaurant_provider.dart';
import 'package:restoran/provider/favorite_provider.dart';
import 'package:restoran/provider/preferences_provider.dart';
import 'package:restoran/ui/list_page.dart';
import 'package:restoran/utils/notification_helper.dart';
import 'package:restoran/style/restaurant_theme.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();

  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  await notificationHelper.configureLocalTimeZone();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(client: http.Client()),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Restaurant App',
            debugShowCheckedModeBanner: false,
            theme: RestaurantTheme.lightTheme,
            darkTheme: RestaurantTheme.darkTheme,
            themeMode: provider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            home: const RestaurantListPage(),
          );
        },
      ),
    );
  }
}
