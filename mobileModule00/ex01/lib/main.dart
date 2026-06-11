// ================================================
//  EX02 - More Buttons (Piscine Mobile - Module 00)
//  Calculadora - Solo Interfaz + Debug Console
// ================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Controladores para los campos de texto (mejor práctica)
  final TextEditingController _expressionController = TextEditingController(text: "0");
  final TextEditingController _resultController = TextEditingController(text: "0");

  // Función que se llama cuando se pulsa cualquier botón
  void _onButtonPressed(String value) {
    // ✅ Usamos debugPrint (mejor que print en Flutter)
    debugPrint("button pressed: $value");

    // Por ahora solo mostramos en consola (como pide el ejercicio 02)
    // En el ejercicio 03 aquí actualizaremos la expresión y el resultado
  }

  @override
  void dispose() {
    // Liberamos memoria de los controladores (importante)
    _expressionController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  // Widget reutilizable para crear botones
  Widget _buildButton(String text, 
                     {Color? color, 
                      Color textColor = Colors.white, 
                      int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color(0xFF2A2A2A),
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 22),
            elevation: 3,
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // === ZONA DE PANTALLA (Expression + Result) ===
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF1E1E1E),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Campo de expresión
                  TextField(
                    controller: _expressionController,
                    readOnly: true,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 28, color: Colors.white70),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                  const Divider(color: Colors.grey, height: 10),
                  // Campo de resultado
                  TextField(
                    controller: _resultController,
                    readOnly: true,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ],
              ),
            ),

            // === TECLADO ===
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                color: const Color(0xFF121212),
                child: Column(
                  children: [
                    // Fila 1
                    Row(children: [
                      _buildButton("AC", color: Colors.redAccent),
                      _buildButton("C", color: Colors.orange),
                      _buildButton("/", color: Colors.blue),
                      _buildButton("*", color: Colors.blue),
                    ]),
                    // Fila 2
                    Row(children: [
                      _buildButton("7"),
                      _buildButton("8"),
                      _buildButton("9"),
                      _buildButton("-", color: Colors.blue),
                    ]),
                    // Fila 3
                    Row(children: [
                      _buildButton("4"),
                      _buildButton("5"),
                      _buildButton("6"),
                      _buildButton("+", color: Colors.blue),
                    ]),
                    // Fila 4
                    Row(children: [
                      _buildButton("1"),
                      _buildButton("2"),
                      _buildButton("3"),
                      _buildButton("=", color: Colors.green, textColor: Colors.black),
                    ]),
                    // Fila 5 - El 0 ocupa dos espacios
                    Row(children: [
                      _buildButton("0", flex: 2),
                      _buildButton("."),
                      _buildButton("=", color: Colors.green, textColor: Colors.black),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}