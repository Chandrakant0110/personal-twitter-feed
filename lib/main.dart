import 'package:flutter/material.dart';
import 'package:social_media_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Twitter Feed',
      
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(primary: Colors.white),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const FeedScreen(),
    );
  }
}
