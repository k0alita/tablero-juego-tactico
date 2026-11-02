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
                color: Colors.blue.shade200,
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