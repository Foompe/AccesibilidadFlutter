import 'package:flutter/material.dart';

class PedidoCardWidget extends StatelessWidget {
  const PedidoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        color: Colors.green[300],
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const SizedBox(
          height: 80,
          child: Text("Pedido"), // altura fija para que se vea
        ),
      ),
    );
  }
}