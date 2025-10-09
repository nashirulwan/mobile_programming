import 'package:flutter/material.dart';
import 'package:modul_10/model/game.dart';
import 'package:modul_10/viewmodel/fetchgame.dart';

TextField _searchBar() {
  return TextField(
    cursorColor: Colors.blue,
    decoration: InputDecoration(
      fillColor: Colors.blue.shade50,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      prefixIcon: const Icon(
        Icons.search_outlined,
        color: Colors.blue,
        size: 30,
      ),
      hintText: 'Cari game',
      hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
    ),
  );
}

Card _listItem(String urlCover, String judul, String genre) {
  return Card(
    clipBehavior: Clip.antiAlias,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: ListTile(
      tileColor: Colors.blue.shade50,
      leading: SizedBox(
        width: 75,
        height: 75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(urlCover, fit: BoxFit.cover),
        ),
      ),
      title: Text(judul),
      subtitle: Text(genre),
      trailing: const Icon(Icons.more_vert),
      isThreeLine: false,
      titleAlignment: ListTileTitleAlignment.center,
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variabel untuk menyimpan hasil pemanggilan API
  late Future<List<Game>> gameList;

  @override
  void initState() {
    super.initState();
    // Memanggil API hanya satu kali saat halaman pertama kali dibuka
    gameList = fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              _searchBar(),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<Game>>(
                  // Gunakan variabel 'gameList' yang sudah ada, jangan panggil fetchGames() lagi
                  future: gameList,
                  builder: (context, snapshot) {
                    // Saat data masih loading, tampilkan loading indicator
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // Jika ada error, tampilkan pesan error
                    else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    // Jika data tidak ada atau kosong
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Tidak ada data game.');
                    }
                    // Jika data berhasil didapatkan
                    else {
                      final games = snapshot.data!.take(25).toList();
                      return ListView.builder(
                        itemCount: games.length,
                        itemBuilder: (context, index) {
                          final game = games[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: game.id,
                              );
                            },
                            child: _listItem(
                              game.thumbnail,
                              game.title,
                              game.genre,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
