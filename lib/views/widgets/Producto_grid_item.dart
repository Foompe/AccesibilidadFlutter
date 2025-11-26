import 'package:flutter/material.dart';

class ProductoGridItem extends StatelessWidget {
  const ProductoGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    image: const DecorationImage(
                      image: AssetImage('assets/img/cocacola.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Text("Nombre del producto", textAlign: TextAlign.center),
            ],
          ),
          // Círculo cantidad arriba derecha
          Positioned(
            top: 4,
            right: 4,
            child: CircleAvatar(
              radius: 12,
              child: Text("0"), // cantidad
            ),
          ),
          // Botón "-" arriba izquierda
          Positioned(
            top: 4,
            left: 4,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              child: Icon(Icons.remove, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
