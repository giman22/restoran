Ada tiga kriteria yang harus Anda penuhi untuk membangun aplikasi Flutter dengan machine learning.

Kriteria 1: Membuat Halaman Daftar Kantor Google
Anda diminta untuk membuat project yang dapat menampilkan daftar kantor Google. Tujuannya utama fitur ini adalah mengimplementasikan StatefulWidget dan mampu menampilkan halaman daftar dengan beberapa widget dari materi kelas. 

Berdasarkan tujuan tersebut, berikut kriteria penilaian yang harus terpenuhi dalam submission ini.

Reject (0 pts)
Tidak ada halaman HomePage atau aplikasi crash.
Tidak ditemukan halaman HomePage pada folder lib/view.
Tidak memenuhi kriteria Basic.
Basic (2 pts)
Halaman HomePage dibuat dengan tipe StatefulWidget.
Menampilkan 10 daftar kantor Google menggunakan widget ListView.
Menampilkan informasi minimal dari kantor Google, seperti nama, alamat, dan gambar.
Memanfaatkan widget InkWell untuk bernavigasi ke halaman detail.
Skilled (3 pts)
Memenuhi ketentuan sebelumnya (basic).
Ada UI untuk mencari kantor Google dengan widget TextField. Pastikan diletakkan pada body Scaffold.
Fitur pencarian berfungsi dengan benar menggunakan setState untuk memfilter item kantor Google. Kata kunci yang dipakai bisa dari nama atau alamat dari kantor Google.
Advanced (4 pts)
Memenuhi ketentuan sebelumnya (skilled).
Menampilkan daftar kantor Google yang responsif terhadap perubahan layar. Anda bisa menggunakan widget GridView ketika lebar layar (width) lebih dari 700 piksel.
Kriteria 2: Membuat Halaman Detail Kantor Google
Kriteria berikutnya diminta untuk melengkapi halaman detail kantor Google. Tujuannya utama fitur ini adalah mengimplementasikan StatelessWidget dan mempercantik tampilan halaman  detail dengan widget-widget yang sudah dipelajari pada materi. 

Berdasarkan tujuan tersebut, berikut ketentuan pada kriteria penilaian yang harus terpenuhi dalam submission ini.

Reject (0 pts)
Tidak ada halaman DetailPage atau aplikasi crash.
Tidak ditemukan halaman DetailPage pada folder lib/view.
Tidak memenuhi kriteria Basic.
Basic (2 pts)
Halaman DetailPage dibuat dengan tipe StatelessWidget.
Berhasil menampilkan seluruh data kantor Google, seperti nama, alamat, gambar, region, nomor telepon, latitude, dan longitude.
Skilled (3 pts)
Memenuhi ketentuan sebelumnya (basic).
Memanfaatkan widget SingleChildScrollView agar konten tetap terlihat ketika ukuran layar (height) kecil.
Menggunakan widget Container dengan BoxDecoration untuk mempercantik tampilan gambar kantor Google. Letakkan widget gambar para parameter child di Container.
Advanced (4 pts)
Memenuhi ketentuan sebelumnya (skilled).
Menggunakan kustomisasi font, khususnya di teks nama kantor Google pada halaman DetailPage.
Kriteria 3: Menerapkan Navigasi & Pengiriman Data
Kriteria terakhir diminta untuk menerapkan navigasi dan pengiriman data. Tujuannya utama fitur ini adalah mengimplementasikan navigasi dasar dengan Navigator yang mampu mengirimkan data ke halaman tujuan. Selain itu, harapannya Anda mampu mengeksplorasi proses navigasi menjadi lebih menarik dengan menambahkan animasi transisi halaman.

Berdasarkan tujuan tersebut, berikut kriteria penilaian yang harus terpenuhi dalam submission ini.

Reject (0 pts)
Navigasi tidak berfungsi dengan benar.
Data di halaman detail tidak sesuai dengan item yang dipilih.
Basic (2 pts)
Berhasil berpindah dari halaman HomePage ke DetailPage menggunakan Navigator.push().
Memanfaatkan widget InkWell untuk bernavigasi ke halaman detail.
Data yang dikirimkan adalah sebuah objek model GoogleOffice.
Gunakan parameter googleOffice pada halaman DetailPage. Jika pakai parameter tersebut, pastikan tidak mengisi nilai pada parameter googleOfficeId.
Skilled (3 pts)
Berhasil berpindah dari halaman HomePage ke DetailPage menggunakan Navigator.push().
Data yang dikirimkan adalah sebuah string ID kantor Google.
Gunakan parameter googleOfficeId bertipe data string pada halaman DetailPage. Jika pakai parameter tersebut, pastikan tidak mengisi nilai pada parameter googleOffice.
Manfaatkan proses filtering data berdasarkan ID kantor Google yang diterima oleh DetailPage. Jalankan proses tersebut pada initializer list, bukan pada fungsi build(). 
Advanced (4 pts)
Memenuhi ketentuan sebelumnya (skilled).
Menerapkan animasi transisi ketika berpindah halaman dengan efek slider SlideTransition dari bawah ke atas.
