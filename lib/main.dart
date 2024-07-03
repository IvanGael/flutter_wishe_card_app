import 'package:flutter/material.dart';
import 'package:wishe_card_app/greeting_card_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wish card app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "FirstChristmas",
      ),
      debugShowCheckedModeBanner: false,
      home: const GreetingCardScreen(),
    );
  }
}

