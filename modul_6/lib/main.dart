import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Fungsi helper di luar class agar bisa dipanggil di mana saja
Container _tombolBaca() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Text('Baca Info', style: TextStyle(color: Colors.white)),
  );
}

Container _listItem(String url, String judul, String genre, String rilis) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            url,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, size: 70);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(genre, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 2),
                      Text(rilis, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  _tombolBaca(),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Game Gratis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
      ),
      home: const GameListPage(),
    );
  }
}

class GameListPage extends StatefulWidget {
  const GameListPage({super.key});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  List dataGame = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  Future<void> _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.freetogame.com/api/games'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Ambil 20 data pertama dari API
          dataGame = data.take(20).toList();
        });
      } else {
        throw Exception('Gagal memuat data dari FreeToGame API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Game Gratis (Top 20)')),
      body: dataGame.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: dataGame.length,
              itemBuilder: (context, index) {
                return _listItem(
                  dataGame[index]['thumbnail'] ??
                      'https://via.placeholder.com/150',
                  dataGame[index]['title'] ?? 'Tidak ada judul',
                  dataGame[index]['genre'] ?? 'Tidak ada genre',
                  dataGame[index]['release_date'] ?? 'Tidak ada tanggal',
                );
              },
            ),
    );
  }
}
