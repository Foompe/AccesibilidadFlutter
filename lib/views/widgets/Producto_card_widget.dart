import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/Producto.dart';

class ProductoCardWidget extends StatelessWidget {
  final Producto producto;
  final int cantidad;

  const ProductoCardWidget({
    super.key,
    required this.producto,
    required this.cantidad,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(160, 191, 163, 255),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 60,

        child: Row(
          children: [
            //Imagen
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(producto.imagen),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            //Espaciado
            const SizedBox(width: 12),

            //Columna con texto
            Expanded(
              flex: 7,
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  producto.nombre,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Cantidad
            Expanded(
              flex: 3,
              child: Container(
                //height: double.infinity,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  "$cantidad Ud",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
