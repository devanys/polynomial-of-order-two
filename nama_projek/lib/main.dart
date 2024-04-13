// lib/main.dart
import 'package:flutter/material.dart';
import 'view.dart';

void main() {
  runApp(DevanAPP());
}

class DevanAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS SKB ',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CurveView(),
    );
  }
}
