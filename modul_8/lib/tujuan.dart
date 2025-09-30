import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen_arguments.dart';

class Tujuan extends StatelessWidget {
  const Tujuan({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Image.network(args.cover, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              args.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 47, 72),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              args.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 47, 72),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF0081c9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 15,
                              color: Color(0xFFF4F8FB),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Kembali ke game',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFF4F8FB),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
