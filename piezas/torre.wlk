import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException

class Torre inherits Pieza{

    override method posiblesMovimientos() {
    const casActual = self.casillero()
    const movimientos = #{}    // resultado final

    // Arriba
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroArribaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    //izquierda
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroIzquierdaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Abajo
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroAbajoDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Derecha
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroDerechaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    return movimientos
  }


}