// lib/main.dart

// Este código es un ejemplo básico de una aplicación Flutter que muestra un texto y un botón.
// Al pulsar el botón, se imprime un mensaje en la consola, pero el texto en la pantalla no cambia.
// El diseño se centra en el medio de la pantalla, con un fondo blanco, un texto verde y un botón verde, 
// siguiendo las especificaciones del ejercicio.
// Será en el próximo ejercicio donde se implementará la funcionalidad para cambiar el texto al pulsar el botón.

import 'package:flutter/material.dart';

void main() {
  // Punto de entrada de la aplicación Flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget raíz que configura el tema y navegación
    return MaterialApp(
      title: 'ex00 - Basic Display',
      debugShowCheckedModeBanner: false, // Quita la cinta de debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Este es el texto inicial que se muestra
  String displayText = "A simple text";

  // Función que se ejecuta al pulsar el botón
  void _onButtonPressed() {
    // IMPORTANTE: Solo imprime en consola, NO cambia el estado de la UI
    debugPrint("Button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo blanco como en el ejemplo del subject
      backgroundColor: Colors.white,

      body: Center(
        // Center centra vertical y horizontalmente todo su hijo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
          crossAxisAlignment: CrossAxisAlignment.center, // Centrado horizontal
          children: [
            // === Text Widget ===
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF8BC34A), // Verde como en la imagen
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                displayText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30), // Espacio entre texto y botón

            // === Button ===
            ElevatedButton(
              onPressed: _onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8BC34A),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text("Press me"),
            ),
          ],
        ),
      ),
    );
  }
}