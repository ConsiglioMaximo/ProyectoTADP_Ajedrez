class Pieza{

var property casillero = null
var property esBlanco = true

method posiblesMovimientos()

method mover(unCasillero)

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

}