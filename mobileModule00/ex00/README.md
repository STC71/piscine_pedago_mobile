# 📱 Exercise 00 - A Basic Display

**Piscine Mobile - Module 00**  
**Introducción al Desarrollo Mobile con Flutter**

 sternero - junio 2026

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![42 Málaga](https://img.shields.io/badge/42_Málaga-000000?style=for-the-badge&logo=42&logoColor=white)

---

## 🎯 Objetivo del Ejercicio

Desarrollar la **primera aplicación móvil** desde cero utilizando **Flutter**. 

El objetivo es crear una pantalla simple pero completamente funcional y **responsiva** que demuestre el dominio de los conceptos básicos del framework:

- Mostrar un texto centrado
- Incluir un botón debajo del texto
- Que al pulsar el botón se imprima en consola el mensaje: **"Button pressed"**

---

## ✨ Características Implementadas

- ✅ Interfaz limpia y moderna siguiendo el **Material Design** de Google
- ✅ Diseño **100% centrado** tanto horizontal como verticalmente
- ✅ **Totalmente responsivo**: se adapta perfectamente a teléfonos, tablets y diferentes tamaños de pantalla
- ✅ Interacción con botón que genera feedback visual y mensaje en consola
- ✅ Código limpio, estructurado y bien comentado
- ✅ Cumplimiento estricto de los requisitos del subject

---

## 🖼️ Capturas de Pantalla

| Teléfono (Portrait) | Tablet / Landscape |
|---------------------|--------------------|
| ![Phone Screenshot](screenshots/phone.png) | ![Tablet Screenshot](screenshots/tablet.png) |

---

## 📚 ¿Qué aprendemos? (Explicación Detallada para todos los públicos)

Este ejercicio marca el **primer contacto real** con Flutter. Aquí se explican todos los conceptos clave aprendidos:

### 1. **Estructura Básica de un Proyecto Flutter**
- `main.dart` → archivo principal donde inicia la aplicación.
- `pubspec.yaml` → archivo de configuración (dependencias, assets, etc.).
- Carpetas `android/` e `ios/` → código nativo generado automáticamente.
- `lib/` → donde vive todo el código Dart de la app.

### 2. **El Widget Tree (Árbol de Widgets)**
En Flutter **todo es un Widget**. La interfaz se construye como un árbol:
- `MaterialApp` → configura la aplicación (título, tema, ruta inicial)
- `Scaffold` → estructura básica de pantalla (AppBar, Body, FloatingActionButton, etc.)
- `Center` + `Column` → para centrar elementos
- `Text` y `ElevatedButton` → widgets básicos de contenido e interacción

### 3. **StatelessWidget vs StatefulWidget**
- Usamos **StatelessWidget** porque la pantalla no necesita cambiar de estado internamente (por ahora).
- Entendí la diferencia entre widgets inmutables y aquellos que pueden cambiar con el tiempo.

### 4. **Gestión de Layout y Responsividad**
- `MainAxisAlignment.center` y `CrossAxisAlignment.center`
- Uso de `Expanded`, `Padding` y `SafeArea`
- Cómo hacer que la aplicación se vea bien en cualquier dispositivo sin romperse

### 5. **Manejo de Eventos (Gestos)**
- `onPressed` del botón
- Uso de `debugPrint()` (mejor que `print()` en Flutter) para mostrar mensajes en la consola de desarrollo

### 6. **Temas y Estilos**
- Aplicación de `ThemeData.dark()`
- Personalización de colores, tipografía y elevación de botones

---

## 🛠️ Tecnologías y Conceptos Clave

- **Flutter** → Framework de Google para crear aplicaciones nativas compiladas desde un solo código base (iOS + Android)
- **Dart** → Lenguaje de programación moderno, orientado a objetos y con tipado fuerte
- **Widgets** → Bloques de construcción básicos (comparables a componentes en React)
- **Hot Reload** → Una de las características más potentes de Flutter (ver cambios en tiempo real)
- **Material Design** → Sistema de diseño de Google

---

## 🚀 Cómo Ejecutar el Proyecto

```bash
# 1. Clonar o entrar en la carpeta
cd mobileModule00/ex00

# 2. Instalar dependencias
flutter pub get

# 3. Ejecutar en emulador o dispositivo físico
flutter run