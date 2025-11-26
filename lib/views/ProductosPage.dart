import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/productos_data.dart';
import 'package:t4_1_navegacion/views/widgets/Pedido_card_widget.dart';
import 'package:t4_1_navegacion/views/widgets/Producto_card_widget.dart';
import 'package:t4_1_navegacion/views/widgets/Producto_grid_item.dart';

class Productospage extends StatelessWidget {
  const Productospage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductosPage"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: Column(
        children: [
          //Campo de texto (mesa - nombre)
          Container(
            width: double.infinity,
            color: Colors.yellow[300],
            padding: const EdgeInsets.all(12),
            child: const Text(
                  "Mesa / Nombre: ------",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),  
          ),
          
          //Lista de producos
          Expanded(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1
                ),
                itemCount: productosDisponibles.length,
                itemBuilder: (context, index) {
                  final producto = productosDisponibles[index];
                  return ProductoGridItem(producto: producto);
                },
              ),
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
                    //! vuelve a CreacionPage
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Confirmar",
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
                    //! vuelve a CreacionPage
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