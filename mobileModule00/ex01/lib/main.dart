// El objetivo de este ejercicio es crear un TextField que permita al usuario escribir algo, 
// y mostrar ese texto en tiempo real debajo del campo de entrada. 
// Para lograr esto, necesitamos usar un StatefulWidget para gestionar el estado del texto ingresado por el usuario.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("ex01: Say Hello!")),
        // debugShowCheckedModeBanner: false, // Quita la cinta de debug
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Estado inicial: definimos un booleano para controlar el cambio de texto
  bool _isHello = false;

  void _toggleText() {
    setState(() {
      // Cambiamos el estado (true/false) al pulsar
      _isHello = !_isHello;
    });
    // Recordatorio: el sujeto en ex00 pedía imprimir en consola
    debugPrint("Button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // El texto cambia dinámicamente según el valor de _isHello 
          Text(
            _isHello ? "Hello World!" : "A simple text",
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleText,
            child: const Text("Click me"),
          ),
        ],
      ),
    );
  }
}