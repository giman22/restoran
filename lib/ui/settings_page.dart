import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoran/provider/preferences_provider.dart';
import 'package:restoran/utils/notification_helper.dart';
import 'package:restoran/main.dart';

class SettingsPage extends StatefulWidget {
  static const String settingsRoute = '/settings_page';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan")),
      body: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              ListTile(
                title: const Text("Mode Gelap"),
                subtitle: const Text("Aktifkan tampilan tema gelap"),
                trailing: Switch(
                  value: provider.isDarkTheme,
                  onChanged: (value) {
                    provider.enableDarkTheme(value);
                  },
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text("Daily Reminder"),
                subtitle: const Text("Notifikasi makan siang jam 11:00 AM"),
                trailing: Switch(
                  value: provider.isDailyReminderActive,
                  onChanged: (value) async {
                    final messenger = ScaffoldMessenger.of(context);

                    provider.enableDailyReminder(value);

                    if (value) {
                      await NotificationHelper()
                          .scheduleDailyElevenAMNotification(
                            flutterLocalNotificationsPlugin,
                          );
                    } else {
                      await NotificationHelper().cancelNotification(
                        flutterLocalNotificationsPlugin,
                      );
                    }

                    if (!mounted) return;

                    messenger.showSnackBar(
                      SnackBar(
                        content: Text(
                          value ? "Reminder diaktifkan!" : "Reminder dimatikan",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
