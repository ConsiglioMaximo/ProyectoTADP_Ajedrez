import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException

class Reina inherits Pieza{

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