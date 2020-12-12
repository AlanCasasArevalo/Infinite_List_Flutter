import 'package:flutter/material.dart';
import 'package:infinite_list_flutter/random-words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite List',
      home: RandomWords(),
      debugShowCheckedModeBanner: false,
    );
  }
}
