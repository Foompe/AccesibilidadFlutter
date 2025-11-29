import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/pedido.dart';
import 'package:t4_1_navegacion/viewmodels/HomeViewModel.dart';
import 'package:t4_1_navegacion/views/CreatePage.dart';
import 'package:t4_1_navegacion/views/widgets/Pedido_card_widget.dart';

class HomePage extends StatefulWidget {
  //Constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Homeviewmodel viewmodel = Homeviewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Home page"),
        elevation: 2,
      ),

      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            itemCount: viewmodel.pedidos.length,
            itemBuilder: (context, index) {
              final pedido = viewmodel.pedidos[index];
              return PedidoCardWidget(
                pedido: pedido,

                //Configuramos que pasa al pulsar la tarjeta
                onTap: () async {
                  final actualizado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreatePage(
                        pedidoExistente: pedido,
                        homeviewmodel: viewmodel
                        ),
                    ),
                  );
                  if (actualizado != null && actualizado is Pedido) {
                    if(!mounted) return;
                    setState(() {
                      viewmodel.agregarPedido(actualizado);
                    });
                  }
                },
              );
            },
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          child: ElevatedButton(
            onPressed: () async {
              // Navegamos a CreatePage sin pedido (nuevo pedido)
              final nuevoPedido = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreatePage(
                    pedidoExistente:null,
                    homeviewmodel: viewmodel,
                    )
                    ),
              );

              if (nuevoPedido != null && nuevoPedido is Pedido) {
                if(!mounted) return;
                setState(() {
                  viewmodel.agregarPedido(nuevoPedido);
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Nuevo pedido",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
