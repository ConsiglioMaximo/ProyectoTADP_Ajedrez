import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException


class Peon inherits Pieza {
  var property primerMovimiento = true

  override method posiblesMovimientos() {
    const movimientos = #{}           // arranco con el set vacío
    const casilleroActual = self.casillero() // Acá me pregunto donde es que esta parada mi pieza
    const casUnoArriba = tablero.casilleroArribaDe(casilleroActual) // Le pregunto al tablero GLOBAL cual es la pieza que está arriba de mi pieza actual

    if(casUnoArriba != null && casUnoArriba.vacio()) { // si no tiene casillero arriba (está justo en el borde) o está ocupado, no se puede mover. Esto lo pensé con la modificación de si está dentro del tablero o no...
      movimientos.add(casUnoArriba) //si las anteriores son verdaderas, puedo avanzar

      
      if(primerMovimiento) { // si es el primer movimiento, intento también avanzar dos casilleros
        const casDosArriba = tablero.casilleroArribaDe(casUnoArriba) //Calculo el casillero que está dos posiciones arriba y como el casi de una posición me fijo que exista y también esté vacío
        if(casDosArriba != null && casDosArriba.vacio()) {
          movimientos.add(casDosArriba)
        }
      }
    }

    return movimientos // todos los movimientos válidos
  }



override method mover(unCasillero) {  
    if(self.posiblesMovimientos().contains(unCasillero)){
        casillero.desocupar()
        unCasillero.ocuparCon(self)
        self.primerMovimiento(false) //faltaba el setter
    }
    else{
        throw new UserException(message = "Movimiento invalido")
    }
}
}
