import tablero.*
import casillero.Casillero
import piezas.alfil.Alfil
import piezas.caballo.Caballo
import piezas.peon.Peon
import piezas.torre.Torre
import piezas.reina.Reina
import piezas.rey.Rey


class Jugador{
const color 
var property esTuTurno


method tusPiezas(){
    return tablero.piezasDe(color)
}
method mover(filaPieza,columnaPieza,filaMov,columnaMov){
    const pieza = tablero.dameElCasillero(filaPieza,columnaPieza).pieza()
    const unMovimiento = tablero.dameElCasillero(filaMov,columnaMov)
    if (self.tusPiezas().contains(pieza) &&  esTuTurno){
        pieza.mover(unMovimiento)
        ajedrez.jB().esTuTurno(!(ajedrez.jB().esTuTurno())) //True   -> false
        ajedrez.jN().esTuTurno(!(ajedrez.jN().esTuTurno())) // False -> true 
    } else{throw new UserException(message = "NO ES TU TURNO!!!!!")}
    }
}


object ajedrez {

const property jB = new Jugador(color = true, esTuTurno = true)
const property jN = new Jugador(color = false, esTuTurno = false)

method empezarPartida(){
    self.crearTodo()
}

 method crearTodo(){
    tablero.crearCasilleros()
    //                                                          PIEZAS BLANCAS
    const peon10 = new Peon()
    tablero.dameElCasillero(1,0).ocuparCon(peon10)
    tablero.agregarPieza(peon10)

    const peon11 = new Peon()
    tablero.dameElCasillero(1,1).ocuparCon(peon11)
    tablero.agregarPieza(peon11)

    const peon12 = new Peon()
    tablero.dameElCasillero(1,2).ocuparCon(peon12)
    tablero.agregarPieza(peon12)

    const peon13 = new Peon()
    tablero.dameElCasillero(1,3).ocuparCon(peon13)
    tablero.agregarPieza(peon13)

    const peon14 = new Peon()
    tablero.dameElCasillero(1,4).ocuparCon(peon14)
    tablero.agregarPieza(peon14)

    const peon15 = new Peon()
    tablero.dameElCasillero(1,5).ocuparCon(peon15)
    tablero.agregarPieza(peon15)

    const peon16 = new Peon()
    tablero.dameElCasillero(1,6).ocuparCon(peon16)
    tablero.agregarPieza(peon16)

    const peon17 = new Peon()
    tablero.dameElCasillero(1,7).ocuparCon(peon17)
    tablero.agregarPieza(peon17)

    const torre00 = new Torre()
    tablero.dameElCasillero(0,0).ocuparCon(torre00)
    tablero.agregarPieza(torre00)

    const caballo01 = new Caballo()
    tablero.dameElCasillero(0,1).ocuparCon(caballo01)
    tablero.agregarPieza(caballo01)

    const alfil02 = new Alfil()
    tablero.dameElCasillero(0,2).ocuparCon(alfil02)
    tablero.agregarPieza(alfil02)

    const reina03 = new Reina()
    tablero.dameElCasillero(0,3).ocuparCon(reina03)
    tablero.agregarPieza(reina03)

    const rey04 = new Rey()
    tablero.dameElCasillero(0,4).ocuparCon(rey04)
    tablero.agregarPieza(rey04)

    const alfil05 = new Alfil()
    tablero.dameElCasillero(0,5).ocuparCon(alfil05)
    tablero.agregarPieza(alfil05)

    const caballo06 = new Caballo()
    tablero.dameElCasillero(0,6).ocuparCon(caballo06)
    tablero.agregarPieza(caballo06)

    const torre07 = new Torre()
    tablero.dameElCasillero(0,7).ocuparCon(torre07)
    tablero.agregarPieza(torre07)

    //                                                      PIEZAS NEGRAS

    const peon60 = new Peon()
    peon60.esBlanco(false)
    tablero.dameElCasillero(6,0).ocuparCon(peon60)
    tablero.agregarPieza(peon60)

    const peon61 = new Peon()
    peon61.esBlanco(false)
    tablero.dameElCasillero(6,1).ocuparCon(peon61)
    tablero.agregarPieza(peon61)

    const peon62 = new Peon()
    peon62.esBlanco(false)
    tablero.dameElCasillero(6,2).ocuparCon(peon62)
    tablero.agregarPieza(peon62)

    const peon63 = new Peon()
    peon63.esBlanco(false)
    tablero.dameElCasillero(6,3).ocuparCon(peon63)
    tablero.agregarPieza(peon63)

    const peon64 = new Peon()
    peon64.esBlanco(false)
    tablero.dameElCasillero(6,4).ocuparCon(peon64)
    tablero.agregarPieza(peon64)

    const peon65 = new Peon()
    peon65.esBlanco(false)
    tablero.dameElCasillero(6,5).ocuparCon(peon65)
    tablero.agregarPieza(peon65)

    const peon66 = new Peon()
    peon66.esBlanco(false)
    tablero.dameElCasillero(6,6).ocuparCon(peon66)
    tablero.agregarPieza(peon66)

    const peon67 = new Peon()
    peon67.esBlanco(false)
    tablero.dameElCasillero(6,7).ocuparCon(peon67)
    tablero.agregarPieza(peon67)

    const torre70 = new Torre()
    torre70.esBlanco(false)
    tablero.dameElCasillero(7,0).ocuparCon(torre70)
    tablero.agregarPieza(torre70)

    const caballo71 = new Caballo()
    caballo71.esBlanco(false)
    tablero.dameElCasillero(7,1).ocuparCon(caballo71)
    tablero.agregarPieza(caballo71)

    const alfil72 = new Alfil()
    alfil72.esBlanco(false)
    tablero.dameElCasillero(7,2).ocuparCon(alfil72)
    tablero.agregarPieza(alfil72)

    const reina73 = new Reina()
    reina73.esBlanco(false)
    tablero.dameElCasillero(7,3).ocuparCon(reina73)
    tablero.agregarPieza(reina73)

    const rey74 = new Rey()
    rey74.esBlanco(false)
    tablero.dameElCasillero(7,4).ocuparCon(rey74)
    tablero.agregarPieza(rey74)

    const alfil75 = new Alfil()
    alfil75.esBlanco(false)
    tablero.dameElCasillero(7,5).ocuparCon(alfil75)
    tablero.agregarPieza(alfil75)

    const caballo76 = new Caballo()
    caballo76.esBlanco(false)
    tablero.dameElCasillero(7,6).ocuparCon(caballo76)
    tablero.agregarPieza(caballo76)

    const torre77 = new Torre()
    torre77.esBlanco(false)
    tablero.dameElCasillero(7,7).ocuparCon(torre77)
    tablero.agregarPieza(torre77)
}
}

