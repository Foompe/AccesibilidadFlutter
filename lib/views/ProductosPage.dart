import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/productos_data.dart';
import 'package:t4_1_navegacion/viewmodels/Pedidos_viewmodel.dart';
import 'package:t4_1_navegacion/views/widgets/Producto_grid_item.dart';

class Productospage extends StatefulWidget {
  final PedidosViewmodel viewmodel;

  const Productospage({super.key, required this.viewmodel});

  @override
  State<Productospage> createState() => _ProductospageState();
}

class _ProductospageState extends State<Productospage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductosPage"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: SafeArea(
        child: Column(
          children: [
            //Campo de texto (mesa - nombre)
            Container(
              width: double.infinity,
              color: Colors.yellow[300],
              padding: const EdgeInsets.all(12),
              child: Text(
                "Mesa / Nombre: ${widget.viewmodel.pedido.nombreMesa}",
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
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1,
                  ),
                  itemCount: productosDisponibles.length,
                  itemBuilder: (context, index) {
                    final producto = productosDisponibles[index];
                    final cantidad =
                        widget.viewmodel.productosSeleccionados[producto] ?? 0;

                    return ProductoGridItem(
                      producto: producto,
                      cantidad: cantidad,
                      onAgregar: () {
                        widget.viewmodel.agregarProducto(producto);
                        setState(() {});
                      },
                      onQuitar: () {
                        widget.viewmodel.quitarProducto(producto);
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      //Bottom bar con los botones
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
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

              //Separador boton
              const SizedBox(width: 12),

              //Boton Guardar
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, widget.viewmodel.pedido);
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
            ],
          ),
        ),
      ),
    );
  }
}
