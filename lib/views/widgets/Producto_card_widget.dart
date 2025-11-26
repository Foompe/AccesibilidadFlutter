import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/Producto.dart';

class ProductoCardWidget extends StatelessWidget {
  final Producto producto;
  final int cantidad;

  const ProductoCardWidget({
    super.key,
    required this.producto,
    required this.cantidad
    });

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