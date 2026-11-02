import 'package:flutter/material.dart';

void main() {
  runApp(const JuegoTactico());
}

class JuegoTactico extends StatelessWidget {
  const JuegoTactico({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tablero Juego Tactico",
      debugShowCheckedModeBanner: false,
      home: const Tablero(),
    );
  }
}

class Tablero extends StatelessWidget {
  const Tablero({super.key});

  Widget crearCasilla() {
    return Expanded(child: Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade500,
        border: Border.all(
          color: Colors.blueGrey.shade400,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Icon(
          Icons.shield,
          color: Colors.white54,
        ),
      ),
    ));
  }

  Widget crearFila() {
    return Expanded(child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        crearCasilla(),
        crearCasilla(),
        crearCasilla(),
        crearCasilla(),
        ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tablero Juego Tactico", style: TextStyle(color: Colors.black, fontWeight: FontWeight(400))),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Column(
        children: [
          Expanded(flex: 2, child: Row(
            children: [
              Expanded(flex: 3, child: Container(
                padding: const EdgeInsets.all(4),
                color: Colors.blueGrey.shade600,
                child: Column(
                  children: [
                    crearFila(),
                    crearFila(),
                    crearFila(),
                    crearFila()
                  ],
                ),
              )),
              Expanded(flex: 2, child: Container(
                color: Colors.blueGrey.shade200,
              ))
            ],
          )),
          Expanded(
            child: Container(
              color: Colors.grey.shade300,
            ),
          )
        ],
      ),
    );
  }
}