import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException


class Alfil inherits Pieza {

  override method posiblesMovimientos() {
    const casActual = self.casillero()
    const movimientos = #{}    // resultado final

    // Arriba - derecha
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroArribaDerechaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Arriba - izquierda
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroArribaIzquierdaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Abajo - derecha
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroAbajoDerechaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Abajo - izquierda
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroAbajoIzquierdaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    return movimientos
  }


}
