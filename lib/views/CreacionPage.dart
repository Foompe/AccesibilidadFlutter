import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/views/ProductosPage.dart';
import 'package:t4_1_navegacion/views/widgets/Pedido_card_widget.dart';
import 'package:t4_1_navegacion/views/widgets/Producto_card_widget.dart';

class CreacionPage extends StatelessWidget {
  const CreacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    //! Cambiar
    final productos = List.generate(15, (i) => "Producto ${i + 1}");

    return Scaffold(
      appBar: AppBar(
        title: const Text("CreacionPage"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: Column(
        children: [
          //Campo de texto (mesa - nombre)
          Container(
            color: Colors.yellow[300],
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mesa / Nombre",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Introduce mesa o Nombre",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    //Boton cuadrado
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Productospage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Separador
          //const SizedBox(height: 12),

          //Lista de producos
          Expanded(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  return ProductoCardWidget();
                },
              ),
            ),
          ),

          //Separador
          //const SizedBox(height: 12),

          //Total
          Container(
            color: Colors.orange[300],
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: const Text(
              "Total: ---,--€",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),

      //Bottom bar con los botones
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              //Boton Guardar
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    //Todo: implemenar logica de guardar
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Guardar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              //Separador boton
              const SizedBox(width: 12),

              //Boton cancelar
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
