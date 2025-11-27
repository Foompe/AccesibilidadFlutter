import 'package:flutter/material.dart';

class Createpage extends StatelessWidget {
  const Createpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 255, 242),
        centerTitle: true,
        title: Text(
          "CreatePage",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 2,
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.blueGrey,
              shadowColor: Colors.black,
              elevation: 5,

              //Todo: Centrar y agragar padding
              child: Column(
                children: [
                  Text(
                    "Introduce nombre / mesa:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
