import 'package:flutter/material.dart';

class HalamanTujuan extends StatelessWidget {
  const HalamanTujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ini Halaman Tujuan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Untuk berpindah ke halaman baru, gunakan metode Navigator.push(). Metode push() akan menambahkan Route ke dalam tumpukan Route yang dikelola oleh Navigator. Route ini dapat dibuat secara kustom atau menggunakan MaterialPageRoute, yang memiliki animasi transisi sesuai dengan platform yang digunakan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset('assets/beach.png', width: 80, height: 80),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Untuk menutup halaman kedua dan kembali ke halaman pertama, gunakan metode Navigator.pop(). Metode pop() akan menghapus Route saat ini dari tumpukan Route yang dikelola oleh Navigator.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 8),
                      Text('Kembali ke home'),
                    ],
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
