import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/views/CreacionPage.dart';
import 'package:t4_1_navegacion/views/HomePage.dart';
import 'package:t4_1_navegacion/views/ProductosPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}
