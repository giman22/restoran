# Restaurant App - Dicoding Flutter Fundamentals

Aplikasi informasi restoran yang dibangun dengan Flutter sebagai bagian dari tugas sertifikasi Dicoding. Proyek ini berfokus pada penerapan Clean Code, State Management, Local Storage, dan Scheduled Notifications.

## 🚀 Fitur Utama

* **List & Detail Restoran**: Menampilkan daftar restoran dari API beserta informasi detail menu makanan dan minuman.
* **Favorite Restaurant**: Menyimpan restoran favorit ke database lokal menggunakan SQLite.
* **Daily Reminder**: Notifikasi terjadwal setiap pukul 11:00 AM untuk mengingatkan waktu makan siang menggunakan `flutter_local_notifications` dan `timezone`.
* **Dark Mode Support**: Mendukung tema terang dan gelap yang tersimpan secara persisten menggunakan `shared_preferences`.
* **Unit Testing**: Pengujian Provider menggunakan `mockito` untuk memastikan validitas data API.

## 🛠️ Detail Teknis & Arsitektur

### 1. State Management
Aplikasi ini menggunakan **Provider** untuk mengelola state secara reaktif, termasuk `RestaurantProvider`, `FavoriteProvider`, dan `PreferencesProvider`.

### 2. Theming (Best Practices)
Sesuai dengan prinsip *Separation of Concern*, pengaturan tema dipusatkan pada `RestaurantTheme`. Tema dikonfigurasi melalui parameter `theme` dan `darkTheme` pada `MaterialApp` agar konsisten di seluruh aplikasi.

### 3. Scheduled Notification
Menggunakan `zonedSchedule` untuk akurasi waktu berdasarkan zona waktu perangkat (`flutter_timezone`). Konfigurasi Android mencakup izin `SCHEDULE_EXACT_ALARM` dan `RECEIVE_BOOT_COMPLETED` agar jadwal tetap berjalan setelah perangkat di-restart.

## 🧪 Pengujian (Testing)

Untuk menjalankan unit test, gunakan perintah berikut:

```bash
flutter test test/restaurant_provider_test.dart
