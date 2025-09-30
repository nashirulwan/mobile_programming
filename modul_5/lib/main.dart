import 'package:flutter/material.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    // a. Gunakan ThemeData.dark() agar tampilan aplikasi terlihat gelap dan elegan.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // b. Buat judul aplikasi pada AppBar dengan teks "Sedang memutar", dan posisikan di tengah
        title: const Text("Sedang memutar"),
        centerTitle: true,
        elevation: 0,
      ),
      // c. Tempatkan widget Card di bagian tengah layar menggunakan Center.
      body: Center(
        child: Card(
          // d. Atur properti Card
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            // d. padding: EdgeInsets.all(12) di dalam Card untuk memberi ruang.
            padding: const EdgeInsets.all(12),
            child: IntrinsicWidth(
              // Membuat lebar card menyesuaikan isinya
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ikon cover album
                  const Icon(
                    Icons.album,
                    size: 60,
                    color: Colors.lightBlueAccent,
                  ),
                  // Jarak tetap antara ikon dan teks
                  const SizedBox(width: 12),
                  // Kolom untuk Judul lagu dan Nama artis
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Judul Lagu di Sini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4), // Jarak tetap antar teks
                      Text(
                        "Nama Artis",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  // Spacer untuk mendorong tombol like ke paling kanan
                  const SizedBox(
                    width: 24,
                  ), // Memberi sedikit jarak sebelum tombol like
                  // Tombol aksi (like)
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
