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
      title: 'Weather App UI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F4F8),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: const Text(
                    'Malang',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: const Text(
                    '25°',
                    style: TextStyle(fontSize: 100, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 100),

              Expanded(
                child: Center(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ForecastItem(
                        day: 'Minggu',
                        icon: Icons.sunny,
                        iconColor: Colors.black,
                        temperature: '20°C',
                      ),
                      ForecastItem(
                        day: 'Senin',
                        icon: Icons.cloudy_snowing,
                        iconColor: Colors.black,
                        temperature: '23°C',
                      ),
                      ForecastItem(
                        day: 'Selasa',
                        icon: Icons.cloud,
                        iconColor: Colors.black,
                        temperature: '22°C',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForecastItem extends StatelessWidget {
  final String day;
  final IconData icon;
  final Color iconColor;
  final String temperature;

  const ForecastItem({
    super.key,
    required this.day,
    required this.icon,
    required this.iconColor,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: const TextStyle(fontSize: 16, color: Colors.black54)),
        const SizedBox(height: 8),
        Icon(icon, color: iconColor, size: 32),
        const SizedBox(height: 8),
        Text(
          temperature,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
