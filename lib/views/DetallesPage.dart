import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/pedido.dart';
import 'package:t4_1_navegacion/views/widgets/Producto_card_widget.dart';

class DetallesPage extends StatelessWidget {
  final Pedido pedido;

  const DetallesPage({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Resumen del pedido",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 2,
      ),

      //lista de productos del pedido
      body: SafeArea(
        child: Column(
          children: [
            //Nombre mesa
            Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "Mesa / nombre: ----",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            //Zona lista de productos
            Expanded(
              child: Container(
                color: Colors.black,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: ListView.builder(
                  itemCount: pedido.productos.length,
                  itemBuilder: (context, index) {
                    final entry = pedido.productos.entries.elementAt(index);
                    final producto = entry.key;
                    final cantidad = entry.value;
                    return ProductoCardWidget(
                      producto: producto,
                      cantidad: cantidad,
                    );
                  },
                ),
              ),
            ),

            //Zona precio total
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                "Total: ${pedido.calcularTotal().toStringAsFixed(2)}€",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),

      //boton volver atras
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Volver",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
