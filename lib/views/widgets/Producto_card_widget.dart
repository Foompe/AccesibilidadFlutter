import 'package:flutter/material.dart';

class ProductoCardWidget extends StatelessWidget {
  const ProductoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        color: Colors.pink,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const SizedBox(
          height: 80,
          child: Text("Producto"), // altura fija para que se vea
        ),
      ),
    );
  }
}