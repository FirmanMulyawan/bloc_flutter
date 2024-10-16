import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Stream<int> countStream() async* {
    for (var i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    log("hello");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Apps"),
      ),
      body: StreamBuilder<int>(
        stream: countStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: 50),
              ),
            );
          } else {
            return Center(
              child: Text(
                "${snapshot.data}",
                style: const TextStyle(fontSize: 50),
              ),
            );
          }
        },
      ),
    );
  }
}
