
import 'package:app2/views/Homepage.dart';
import 'package:app2/views/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const Homepage(),
        'splash_screen':(context) => const splash_screen(),
      },
    ),
  );
}

