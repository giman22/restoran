# Submission Flutter: Google Offices App

Projek ini merupakan aplikasi Flutter yang menampilkan daftar kantor Google di seluruh dunia menggunakan data JSON. Aplikasi ini memenuhi standar kriteria **Advanced** (4 pts) pada setiap kriteria penilaian.

## Fitur Utama & Kriteria Terpenuhi

### 1. Halaman Daftar (HomePage) - Advanced
- **StatefulWidget**: Implementasi di `lib/view/home_page.dart`.
- **Search Bar**: UI menggunakan `TextField` pada body Scaffold dengan logika filtering via `setState`.
- **Responsivitas**: Menggunakan `ListView` untuk layar kecil dan otomatis beralih ke `GridView` saat lebar layar > 700 piksel.
- **Interaksi**: Menggunakan `InkWell` untuk navigasi yang responsif.

### 2. Halaman Detail (DetailPage) - Advanced
- **StatelessWidget**: Implementasi di `lib/view/detail_page.dart`.
- **Informasi Lengkap**: Menampilkan nama, alamat, gambar, region, telepon, serta koordinat (lat/long).
- **UI/UX**: Menggunakan `SingleChildScrollView` untuk mencegah overflow dan `BoxDecoration` untuk mempercantik gambar.
- **Custom Font**: Menggunakan font khusus pada bagian nama kantor Google.

### 3. Navigasi & Pengiriman Data - Advanced
- **ID-Based Navigation**: Data dikirim dalam bentuk `String ID` melalui parameter `googleOfficeId`.
- **Initializer List**: Proses filtering data dilakukan pada *initializer list* sebelum fungsi `build()`.
- **Custom Transition**: Perpindahan halaman menggunakan animasi `SlideTransition` dengan efek geser dari bawah ke atas.

## Struktur Folder
```text
lib/
├── models/
│   └── google_office.dart
├── view/
│   ├── home_page.dart
│   └── detail_page.dart
└── main.dart
