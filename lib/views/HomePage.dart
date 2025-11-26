import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/views/CreacionPage.dart';
import 'package:t4_1_navegacion/views/widgets/Pedido_card_widget.dart';
import 'package:t4_1_navegacion/views/widgets/Producto_card_widget.dart';

class Homepage extends StatelessWidget{  //Constructor
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    //! --> temporal
    final items = List.generate(16, (i) => "Pedido ${i +1}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Home page"),
        elevation: 2,
      ),


      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return PedidoCardWidget();
          },
          ),
        ),


        bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.symmetric(
            horizontal: 16, 
            vertical: 12
            ),

          child: ElevatedButton(
              onPressed: () {
                  //? --> Creamos la navegación
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const CreacionPage() 
                    )
                    );


              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Nuevo pedido",
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold
                  ),
              ),
            ),
          
        ),
      ),
    );
  }
}
