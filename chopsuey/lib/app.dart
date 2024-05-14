import 'package:chopsuey/pages/home.dart';
import 'package:flutter/material.dart';

class ChopSuey extends StatelessWidget {
  const ChopSuey({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChopSuey',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text("ChopSuey")), body: const Home()),
    );
  }
}
