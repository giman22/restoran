import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restoran/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getTheme();
    _getDailyReminderStatus();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyReminderActive = false;
  bool get isDailyReminderActive => _isDailyReminderActive;

  // State untuk menyimpan daftar notifikasi yang sedang mengantri (Pending)
  List<PendingNotificationRequest> _pendingNotificationRequests = [];
  List<PendingNotificationRequest> get pendingNotificationRequests => _pendingNotificationRequests;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyReminderStatus() async {
    _isDailyReminderActive = await preferencesHelper.isDailyReminderActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyReminder(bool value) {
    preferencesHelper.setDailyReminder(value);
    _getDailyReminderStatus();
  }

  // Fungsi untuk mengecek notifikasi yang sedang terjadwal sesuai materi
  Future<void> checkPendingNotificationRequests(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    _pendingNotificationRequests = await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    notifyListeners();
  }
}