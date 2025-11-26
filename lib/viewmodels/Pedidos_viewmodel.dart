import 'package:flutter/material.dart';
import 'package:t4_1_navegacion/models/Producto.dart';
import 'package:t4_1_navegacion/models/pedido.dart';

class PedidosViewmodel extends ChangeNotifier{
  Pedido pedido;

  PedidosViewmodel({required this.pedido});

  void agregarProducto(Producto p) {
    pedido.agregarProducto(p);
    notifyListeners();
  }

  void quitarProducto(Producto p) {
    pedido.restarProducto(p);
    notifyListeners();
  }

  Map<Producto, int> get productosSeleccionados => pedido.productos;
}