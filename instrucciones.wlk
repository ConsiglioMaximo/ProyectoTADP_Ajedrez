/*
Instrucciones para poder jugar al ajedrez wollistico:

1- Primero lo importante importantísimo, empezar la partida:

Ejecutar el archivo jugarAjedrez.wlk

ajedrez.empezarPartida()

Esto:

- Crea los 64 casilleros
- Coloca todas las piezas
- Dibuja el tablero
- Setea que empiezan las blancas.

2- Para mover una pieza:

ajedrez.jB().mover(fila, columna, filaDestino, columnaDestino)


jB() = jugador blanco

jN() = jugador negro

Ejemplo:

ajedrez.jB().mover(1,4,3,4)   // Peón blanco avanza dos casillas
ajedrez.jN().mover(6,3,4,3)   // Peón negro avanza dos casillas

3- Aca les dejamos una situación rápida de jaque mate al blanco:

ajedrez.empezarPartida()
ajedrez.jB().mover(1,5,2,5)
ajedrez.jN().mover(6,4,4,4) 
ajedrez.jB().mover(1,6,3,6) 
ajedrez.jN().mover(7,3,3,7) 

4- Aca les dejamos una situación rápida de jaque mate al negro:

ajedrez.empezarPartida()
ajedrez.jB().mover(1,4,3,4)
ajedrez.jN().mover(6,0,5,0)
ajedrez.jB().mover(0,3,4,7)
ajedrez.jN().mover(6,1,5,1)
ajedrez.jB().mover(4,7,6,5)

5- Otra situación de JAQUE MATE al blanco.

ajedrez.empezarPartida()

ajedrez.jB().mover(1,5,2,5)   // Blanco mueve peón
ajedrez.jN().mover(6,4,4,4)   // Negro libera su reina
ajedrez.jB().mover(1,6,3,6)   // Blanco mueve otro peón
ajedrez.jN().mover(7,3,3,7)   // REINA NEGRA va al mate → JAQUE MATE


6- Un JAQUE (NO mate) interesante y salvable:

ajedrez.empezarPartida()

ajedrez.jB().mover(1,4,3,4) // peón blanco avanza
ajedrez.jN().mover(6,5,4,5) // peón negro abre diagonal
ajedrez.jB().mover(0,3,4,7) // reina blanca sale agresiva
ajedrez.jN().mover(6,6,5,6)
ajedrez.jB().mover(4,7,4,5) // REINA BLANCA da JAQUE en f5

// Negro puede quitarse (no es jaque mate)

MÉTODOS IMPORTANTES

TABLERO

- crearCasilleros(): Crea los 64 casilleros (0–7 en filas, 0–7 en columnas).

- piezasDe(unColor): Devuelve todas las piezas blancas o negras.

- reyDe(unColor): Encuentra el rey del color dado.

- estaEnJaque(unColor): Determina si el rey del color indicado está siendo atacado.

- movimientoEvitaJaque(pieza, casDestino, unColor): Simula un movimiento y ve si deja de estar en jaque.

- hayAlgunaJugadaQueEviteJaque(unColor): Si existe al menos una jugada legal que salve al rey → no es mate.

- estaEnJaqueMate(unColor): Jaque + ninguna jugada que salve → JAQUE MATE.

PIEZAS

- posiblesMovimientos(): Devuelve todos los movimientos LEGALMENTE posibles de la pieza según tipo.

Cada pieza lo redefine:

Peón: avanza, come en diagonal, doble avance, coronación.

Torre: rectas.

Alfil: diagonales.

Reina: combinación torre + alfil.

Caballo: saltos en L.

Rey: 1 casilla alrededor, salvo si es insegura.

CASILLERO

- vacio(): Indica si no tiene pieza.
- ocuparCon(pieza) / desocupar(): Actualiza ocupación del casillero.
- Métodos como casilleroArribaDe, casilleroAbajoDerechaDe, etc: Sirven para navegar el tablero sin reinventar la rueda.

JUGADOR

- mover(): Valida turnos, aplica el movimiento y chequea:

Jaque

Jaque mate

Cambio de turno

PEÓN ESPECIAL

- primerMovimiento: Controla si aún puede mover dos casillas.

- Coronación automática: Cuando llega a fila 0 o 7 → se reemplaza por una Reina del mismo color.
*/