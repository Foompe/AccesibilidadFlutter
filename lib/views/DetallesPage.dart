import 'package:flutter/material.dart';

class DetallesPage extends StatelessWidget {
  const DetallesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "DetallesPage",
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
                child: Text(
                  "cars de productos",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            //Zona precio total
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                "Total: ---.--€",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            )
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
            child: Text(
              "Volver",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
