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
  final String _expression = "0";
  final String _result = "0";

  // Función que se ejecuta al pulsar cualquier botón
  void _onButtonPressed(String value) {
    debugPrint("button pressed: $value");  // Obligatorio según el subject
    // Por ahora no cambiamos nada (eso es para el ex03)
  }

  // Widget para crear botones de forma consistente
  Widget _buildButton(String text, 
                     {Color? color, 
                      Color textColor = Colors.white, 
                      int flex = 1,
                      bool isLandscape = false}) {
    // Si el texto está vacío, renderizamos un espacio en blanco para cuadrar la cuadrícula
    if (text.isEmpty) {
      return Expanded(flex: flex, child: const SizedBox.shrink());
    }

    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.all(isLandscape ? 2.0 : 6.0), // Menos padding (separación) en horizontal
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color(0xFF2A2A2A),
            foregroundColor: textColor,
            minimumSize: const Size(0, 0), // Previene overflow en pantallas horizontal
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.zero, // Eliminado padding fijo para que sea responsive (ocupa el máximo que le permite Expanded)
            elevation: 3,
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: isLandscape ? 20 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

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
            // === PANTALLA (Expression + Result) ===
            Expanded(
              flex: 1, // En landscape damos la misma proporción que al teclado para no cortar texto
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: const Color(0xFF1E1E1E),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true, // Para que el texto que exceda se oculte por la izquierda como en calculadoras reales
                      child: Text(
                        _expression,
                        style: TextStyle(fontSize: isLandscape ? 20 : 28, color: Colors.white70),
                      ),
                    ),
                    const Divider(color: Colors.grey, height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        _result,
                        style: TextStyle(
                          fontSize: isLandscape ? 28 : 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // === TECLADO ===
            Expanded(
              flex: isLandscape ? 2 : 2, // Si es horizontal o vertical le damos flex 2 para botones más altos
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                color: const Color(0xFF121212),
                child: Column(
                  children: [
                    // Fila 1 (Envueltos en Expanded para que se estiren verticalmente y sean full responsive)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch, // ESTO ESTIRA LOS BOTONES VERTICALMENTE
                        children: [
                        _buildButton("AC", color: Colors.redAccent, isLandscape: isLandscape),
                        _buildButton("C", color: Colors.orange, isLandscape: isLandscape),
                        _buildButton("", color: Colors.transparent, isLandscape: isLandscape), // Hueco vacío
                        _buildButton("/", color: Colors.blue, isLandscape: isLandscape),
                      ]),
                    ),
                    // Fila 2
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                        _buildButton("7", isLandscape: isLandscape),
                        _buildButton("8", isLandscape: isLandscape),
                        _buildButton("9", isLandscape: isLandscape),
                        _buildButton("*", color: Colors.blue, isLandscape: isLandscape),
                      ]),
                    ),
                    // Fila 3
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                        _buildButton("4", isLandscape: isLandscape),
                        _buildButton("5", isLandscape: isLandscape),
                        _buildButton("6", isLandscape: isLandscape),
                        _buildButton("-", color: Colors.blue, isLandscape: isLandscape),
                      ]),
                    ),
                    // Fila 4
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                        _buildButton("1", isLandscape: isLandscape),
                        _buildButton("2", isLandscape: isLandscape),
                        _buildButton("3", isLandscape: isLandscape),
                        _buildButton("+", color: Colors.blue, isLandscape: isLandscape), // Reemplazamos un = por +
                      ]),
                    ),
                    // Fila 5 - Botón 00, un solo =, y 0
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                        _buildButton("0", isLandscape: isLandscape),
                        _buildButton(".", isLandscape: isLandscape),
                        _buildButton("00", isLandscape: isLandscape),
                        _buildButton("=", color: Colors.green, textColor: Colors.black, isLandscape: isLandscape), // Unico botón =
                      ]),
                    ),
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