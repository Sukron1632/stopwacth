import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/anggota'); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Warna latar belakang tombol menjadi hitam
                foregroundColor: Colors.white, // Warna teks tombol menjadi putih
              ),
              child: const Text('Daftar Anggota'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi untuk Aplikasi Stopwatch
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Warna latar belakang tombol menjadi hitam
                foregroundColor: Colors.white, // Warna teks tombol menjadi putih
              ),
              child: const Text('Aplikasi Stopwatch'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi untuk Daftar Situs Rekomendasi
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Warna latar belakang tombol menjadi hitam
                foregroundColor: Colors.white, // Warna teks tombol menjadi putih
              ),
              child: const Text('Daftar Situs Rekomendasi'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi untuk Favorite
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Warna latar belakang tombol menjadi hitam
                foregroundColor: Colors.white, // Warna teks tombol menjadi putih
              ),
              child: const Text('Favorite'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
          ),
        ],
        currentIndex: 0, // Indeks saat ini
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/bantuan');
          }
        },
      ),
    );
  }
}
