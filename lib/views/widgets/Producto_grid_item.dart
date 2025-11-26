import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/Producto.dart';

class ProductoGridItem extends StatelessWidget {
  final Producto producto;
  final int cantidad;
  final VoidCallback onAgregar;
  final VoidCallback onQuitar;

  const ProductoGridItem({
    super.key,
    required this.producto,
    required this.cantidad,
    required this.onAgregar,
    required this.onQuitar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAgregar,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: cantidad > 0 ? Colors.blue : Colors.transparent,
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(producto.imagen),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Text(producto.nombre, textAlign: TextAlign.center),
                  Text("${producto.precio} €"),
                ],
              ),

              // Círculo cantidad arriba derecha
              if(cantidad > 0)
              Positioned(
                top: 4,
                right: 4,
                child: CircleAvatar(radius: 12, child: Text("$cantidad")),
              ),

              // Botón "-" arriba izquierda
              if(cantidad > 0)
              Positioned(
                top: 4,
                left: 4,
                child: GestureDetector(
                  onTap: onQuitar,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.remove, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
