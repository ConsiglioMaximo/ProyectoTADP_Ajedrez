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

  // Devuelve todos los casilleros válidos en una dirección (hasta chocar)
  method movimientosEnDireccion(casilleroInicio, paso) {
    const movimientos = #{}
    self.agregarEnDireccion(casilleroInicio, paso, movimientos)
    return movimientos
  }

  // Recorre en una dirección y va llenando el set
  method agregarEnDireccion(casilleroActual, paso, movimientos) {
    const siguiente = paso.apply(casilleroActual)
    // 1) Si no hay más casilleros (borde) → corto
    if(siguiente == null) {
      return null
    }
    // 2) Si está vacío → lo agrego y sigo avanzando
    if(siguiente.vacio()) {
      movimientos.add(siguiente)
      self.agregarEnDireccion(siguiente, paso, movimientos)
    } else {
      // 3) Si hay pieza enemiga → la agrego pero NO sigo
      if(siguiente.piezaBlanca() != self.esBlanco()) {
        movimientos.add(siguiente)
      }
      // Si hay pieza propia, no agrego nada y corto
    }
    return null 
  }

  override method mover(unCasillero) {
    if(self.posiblesMovimientos().contains(unCasillero)) {
      casillero.desocupar()
      unCasillero.ocuparCon(self)
    } else {
      throw new UserException(message = "Movimiento invalido")
    }
  }
}
