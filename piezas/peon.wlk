import piezas.pieza.Pieza
import piezas.reina.Reina
import tablero.tablero
import tablero.UserException

class Peon inherits Pieza {

  var property primerMovimiento = true

  override method posiblesMovimientos() {
    const movimientos = #{}                     
    const casilleroActual = self.casillero()   

    if (casilleroActual == null) return movimientos

    if (self.esBlanco()) {
      self.movimientosPeonBlanco(casilleroActual, movimientos)
    } else {
      self.movimientosPeonNegro(casilleroActual, movimientos)
    }
    return movimientos
  }

  // -------- PEÓN BLANCO (SUBE) --------

  method movimientosPeonBlanco(casilleroActual, movimientos) {

    const casUnoArriba = tablero.casilleroArribaDe(casilleroActual)
    if (casUnoArriba != null && casUnoArriba.vacio()) {
      movimientos.add(casUnoArriba)

      if (self.primerMovimiento()) {
        const casDosArriba = tablero.casilleroArribaDe(casUnoArriba)
        if (casDosArriba != null && casDosArriba.vacio()) {
          movimientos.add(casDosArriba)
        }
      }
    }

    const diagIzq = tablero.casilleroArribaIzquierdaDe(casilleroActual)
    const diagDer = tablero.casilleroArribaDerechaDe(casilleroActual)

    if (diagIzq != null && !diagIzq.vacio() && diagIzq.piezaBlanca() != self.esBlanco()) {
      movimientos.add(diagIzq)
    }
    if (diagDer != null && !diagDer.vacio() && diagDer.piezaBlanca() != self.esBlanco()) {
      movimientos.add(diagDer)
    }
  }

  // -------- PEÓN NEGRO (BAJA) --------

  method movimientosPeonNegro(casilleroActual, movimientos) {

    const casUnoAbajo = tablero.casilleroAbajoDe(casilleroActual)

    if (casUnoAbajo != null && casUnoAbajo.vacio()) {
      movimientos.add(casUnoAbajo)

      if (self.primerMovimiento()) {
        const casDosAbajo = tablero.casilleroAbajoDe(casUnoAbajo)

        if (casDosAbajo != null && casDosAbajo.vacio()) {
          movimientos.add(casDosAbajo)
        }
      }
    }

    const diagIzq = tablero.casilleroAbajoIzquierdaDe(casilleroActual)
    const diagDer = tablero.casilleroAbajoDerechaDe(casilleroActual)

    if (diagIzq != null && !diagIzq.vacio() && diagIzq.piezaBlanca() != self.esBlanco()) {
      movimientos.add(diagIzq)
    }
    if (diagDer != null && !diagDer.vacio() && diagDer.piezaBlanca() != self.esBlanco()) {
      movimientos.add(diagDer)
    }
  }

  // ===========================
  // MOVER + CORONACIÓN
  // ===========================

  override method mover(unCasillero) {

    if (self.posiblesMovimientos().contains(unCasillero)) {

      const origen = self.casillero()
      if (origen != null) {
        origen.desocupar()
      }

      // ¿llegó a la última fila? (blanco arriba = fila 7, negro abajo = fila 0)
      const filaDestino = unCasillero.posFila()
      const llegoUltimaFila = (filaDestino == 7) || (filaDestino == 0)

      if (llegoUltimaFila) {
        // Coronación: crear una Reina del mismo color
        const nuevaReina = new Reina()
        nuevaReina.esBlanco(self.esBlanco())

        unCasillero.ocuparCon(nuevaReina)
        tablero.agregarPieza(nuevaReina)
        // el peón "desaparece" del tablero, no lo volvemos a usar
      }
      else {
        // Movimiento normal
        unCasillero.ocuparCon(self)
        self.primerMovimiento(false)
      }

    } else {
      throw new UserException(message = "Movimiento invalido")
    }
  }

  method print() {
    if (self.esBlanco()) {
      return "♟ "
    } else {
      return "♙ "
    }
  }
}
