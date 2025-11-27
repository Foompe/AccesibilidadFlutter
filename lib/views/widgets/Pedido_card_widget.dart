import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/pedido.dart';

class PedidoCardWidget extends StatelessWidget {
  final Pedido pedido;
  final VoidCallback? onEditar;

  const PedidoCardWidget({
    super.key, 
    required this.pedido,
    required this.onEditar
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            //Icono
            const Icon(Icons.person, size: 32, color: Colors.blueGrey),

            //Separador
            const SizedBox(width: 12),

            //Nombre
            Expanded(
              flex: 3,
              child: Text(
                pedido.nombreMesa,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //Candidad productos
            Expanded(
              flex: 2,
              child: Text(
                "${pedido.productos.length} productos",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),

            //Precio total
            Expanded(
              flex: 2,
              child: Text(
                "${pedido.calcularTotal().toStringAsFixed(2)}€",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            //Boton de info pedido
            IconButton(
              onPressed: onEditar,
              icon: const Icon(Icons.info, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
