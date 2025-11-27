import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/pedido.dart';
import 'package:t4_1_navegacion/viewmodels/Pedidos_viewmodel.dart';
import 'package:t4_1_navegacion/views/ProductosPage.dart';
import 'package:t4_1_navegacion/views/widgets/Producto_card_widget.dart';

class CreacionPage extends StatefulWidget {
  final Pedido? pedidoExistente;

  const CreacionPage({super.key, this.pedidoExistente});

  @override
  State<CreacionPage> createState() => _CreacionPageState();
}

class _CreacionPageState extends State<CreacionPage> {
  late PedidosViewmodel viewmodel;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    //Iniciamos el pedido temporal
    final pedidoTemp = widget.pedidoExistente != null
        ? Pedido(
            nombreMesa: widget.pedidoExistente!.nombreMesa,
            productos: Map.from(widget.pedidoExistente!.productos),
          )
        : Pedido(nombreMesa: "");

    viewmodel = PedidosViewmodel(pedido: pedidoTemp);

    //Cargar el nombre para mostrarlo
    _controller = TextEditingController(text: pedidoTemp.nombreMesa);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CreacionPage"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: SafeArea(
        child: Column(
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
                          controller: _controller,
                          readOnly:
                              widget.pedidoExistente !=
                              null, //No editable si ya trae nombre
                          onChanged: (value) {
                            viewmodel.pedido.nombreMesa = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Introduce mesa o Nombre",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            //! Revisar este widget
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
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    Productospage(viewmodel: viewmodel),
                              ),
                            );

                            if (result != null) {
                              setState(() {}); // Recargar UI
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
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
                child: ListView(
                  children: viewmodel.productosSeleccionados.entries.map((e) {
                    return ProductoCardWidget(
                      producto: e.key,
                      cantidad: e.value,
                    );
                  }).toList(),
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
              child: Text(
                "Total: ${viewmodel.pedido.calcularTotal().toStringAsFixed(2)}€",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
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
              //Boton Guardar
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    //Todo: implemenar logica de guardar
                    Navigator.pop(context, viewmodel.pedido);
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
