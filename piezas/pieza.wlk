import tablero.*

class Pieza{

var property casillero = null
var property esBlanco = true

method posiblesMovimientos()

method mover(unCasillero) {
    if(self.posiblesMovimientos().contains(unCasillero)) {
      casillero.desocupar()
      unCasillero.ocuparCon(self)
    } else {
      throw new UserException(message = "Movimiento invalido")
    }
  }

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
    // Devuelve todos los casilleros válidos en una dirección (hasta chocar)
  method movimientosEnDireccion(casilleroInicio, paso) {
    const movimientos = #{}
    self.agregarEnDireccion(casilleroInicio, paso, movimientos)
    return movimientos
  }

  	method casilleroVaciable(casilla){
		return casilla.vacio() || (casilla.piezaBlanca() != self.esBlanco())
	}
	
	method casilleroValido(casilla){
		return tablero.estaDentro(casilla.posFila(),casilla.posColumna()) != null && self.casilleroVaciable(casilla)
	}
	  
  method agregarMovimientoSiValido(fila, columna, movimientos) {
      if (tablero.estaDentro(fila, columna)) {
        const casilla = tablero.dameElCasillero(fila, columna)
        if (self.casilleroValido(casilla)) {
          movimientos.add(casilla)
          }
        }
    }
}