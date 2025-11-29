import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/pedido.dart';
import 'package:t4_1_navegacion/viewmodels/HomeViewModel.dart';
import 'package:t4_1_navegacion/viewmodels/Pedidos_viewmodel.dart';
import 'package:t4_1_navegacion/views/ProductosPage.dart';

class CreatePage extends StatefulWidget {
  final Pedido? pedidoExistente;
  final Homeviewmodel homeviewmodel;

  const CreatePage({
    super.key,
    this.pedidoExistente,
    required this.homeviewmodel,
  });

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late PedidosViewmodel viewmodel;
  late TextEditingController nombreControl;

  @override
  void initState() {
    super.initState();

    //Si recibimos un pedido lo clonamos , si no , creamos uno nuevo
    final pedidoTemp = widget.pedidoExistente != null
        ? Pedido(
            nombreMesa: widget.pedidoExistente!.nombreMesa,
            productos: Map.from(widget.pedidoExistente!.productos),
          )
        : Pedido(nombreMesa: "");

    viewmodel = PedidosViewmodel(
      pedido: pedidoTemp,
    ); //Creamos viewmodel para este pedido
    nombreControl = TextEditingController(
      text: pedidoTemp.nombreMesa,
    ); //rellenamos el textfield
  }

  @override
  void dispose() {
    nombreControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 255, 242),
        centerTitle: true,
        title: Text("Pedido", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 2,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Mesa / nomrbe: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              //TextField
              TextField(
                controller: nombreControl,
                enabled: widget.pedidoExistente == null,
                onChanged: (value) {
                  setState(() {
                    viewmodel.pedido.nombreMesa = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Introduce nombre de la mesa",
                ),
              ),
              const SizedBox(height: 8),

              //Boton "Añadir"
              ElevatedButton(
                onPressed: () {
                  if (viewmodel.pedido.nombreMesa.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Debes introducir un nombre primero"),
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Productospage(viewmodel: viewmodel),
                    ),
                  ).then((resultado) {
                    if(resultado != null && resultado is Pedido){
                    setState(() {
                      viewmodel.pedido = resultado;
                    });}
                  });
                },
                child: const Text("Añadir productos"),
              ),
              const SizedBox(height: 10),

              //Boton resumen
              ElevatedButton(
                onPressed: widget.pedidoExistente != null
                    ? () {
                        Navigator.pushNamed(
                          context,
                          //!cambiar
                          "/resumen",
                          arguments: viewmodel.pedido,
                        );
                      }
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Debes crear un pedido primero"),
                          ),
                        );
                      },
                child: const Text("Ver resumen"),
              ),
            ],
          ),
        ),
      ),

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
                    if (viewmodel.pedido.nombreMesa.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("El pedido debe tener un nombre"),
                        ),
                      );
                      return;
                    }

                    if (viewmodel.productosSeleccionados.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Debes añadir al menos un producto"),
                        ),
                      );
                      return;
                    }

                    Navigator.pop(
                      context,
                      viewmodel.pedido,
                    ); // devuelve pedido a HomePage
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
