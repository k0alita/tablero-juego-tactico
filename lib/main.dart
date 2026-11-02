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

  Widget crearJugador(String nombre, Color color, IconData icono) {
    return Expanded(child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nombre,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Icon(
            icono,
            color: color,
            size: 36,
          ),
          const SizedBox(height: 12),
          Text(
            "Puntos: 120",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          )
        ],
      ),
    ));
  }
  
  Widget crearMovimiento(String numero, String jugador, String descripcion, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        child: Text(numero),
      ),
      title: Text("$jugador: movio pieza"),
      subtitle: Text(descripcion),
      trailing: const Icon(Icons.history),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tablero Juego Tactico", style: TextStyle(color: Colors.black38, fontWeight: FontWeight(500))),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Column(
        children: [
          Expanded(flex: 2, child: Row(
            children: [
              Expanded(flex: 3, child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.blueGrey.shade700,
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
                color: Colors.blueGrey.shade700,
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade600,
                    borderRadius: BorderRadius.circular(8),
                  ),
                child: Column(
                  children: [
                    crearJugador("Jugador 1 (Azul)", Colors.blue, Icons.person),
                    crearJugador("Jugador 2 (Rojo)", Colors.red, Icons.person_outline)
                  ]
                ),
                ),
              ))
            ],
          )),
          Expanded(
            child: Container(
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(8),
                    child: Text("Historial de movimientos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Expanded(child: ListView(
                    children: [
                      crearMovimiento(
                        '1',
                        'Jugador 1',
                        'Caballero a la casilla C4',
                        Colors.blue,),
                      crearMovimiento(
                        '2',
                        'Jugador 2',
                        'Caballero a la casilla C4',
                        Colors.red,),
                      crearMovimiento(
                        '3',
                        'Jugador 1',
                        'Caballero a la casilla C4',
                        Colors.blue,),
                      crearMovimiento(
                        '4',
                        'Jugador 2',
                        'Caballero a la casilla C4',
                        Colors.red,),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}