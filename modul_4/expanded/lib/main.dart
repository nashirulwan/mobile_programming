import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player UI',
      // a. Gunakan theme aplikasi dengan ThemeData.dark()
      theme: ThemeData.dark(),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemutar Musik'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Pemutar Musik',
          style: TextStyle(fontSize: 24, color: Colors.white54),
        ),
      ),
      // b. Letakkan Control Bar di bagian bawah layar
      bottomNavigationBar: const MusicControlBar(),
    );
  }
}

class MusicControlBar extends StatelessWidget {
  const MusicControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    // c. Bungkus Control Bar dengan Container
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      color: Colors.black54,
      // d. Isi Control Bar terdiri atas 5 tombol ikon
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // e. Gunakan Expanded untuk mendistribusikan ruang secara merata
          Expanded(child: Icon(Icons.shuffle, color: Colors.white)),
          Expanded(child: Icon(Icons.skip_previous, color: Colors.white)),
          // f. Gunakan Flexible dengan flex: 2 dan fit: FlexFit.tight
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 60.0, // Ukuran ikon diperbesar agar menonjol
            ),
          ),
          Expanded(child: Icon(Icons.skip_next, color: Colors.white)),
          Expanded(child: Icon(Icons.repeat, color: Colors.white)),
        ],
      ),
    );
  }
}
