import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException

class Rey inherits Pieza{
	

	override method posiblesMovimientos() {
  const casilleroActual = self.casillero()
		 
  const mov1 = tablero.casilleroArribaDe(casilleroActual)
  const mov2 = tablero.casilleroArribaDerechaDe(casilleroActual)
  const mov3 = tablero.casilleroArribaIzquierdaDe(casilleroActual)
  const mov4 = tablero.casilleroIzquierdaDe(casilleroActual)
  const mov5 = tablero.casilleroAbajoIzquierdaDe(casilleroActual)
  const mov6 = tablero.casilleroAbajoDerechaDe(casilleroActual)
  const mov7 = tablero.casilleroDerechaDe(casilleroActual)
  const mov8 = tablero.casilleroAbajoDe(casilleroActual)
		 
  const movs = #{mov1,mov2,mov3,mov4,mov5,mov6,mov7,mov8}

  // movimientos legales: casilla válida Y segura
  return movs.filter({ c =>
    c != null && self.casilleroValido(c) && c.esSeguroMoverseCon(self)
  })
}

// casilleros que el rey ATACA (no mira si son seguros)
override method casillerosQueAtaca() {
  const casilleroActual = self.casillero()
		 
  const mov1 = tablero.casilleroArribaDe(casilleroActual)
  const mov2 = tablero.casilleroArribaDerechaDe(casilleroActual)
  const mov3 = tablero.casilleroArribaIzquierdaDe(casilleroActual)
  const mov4 = tablero.casilleroIzquierdaDe(casilleroActual)
  const mov5 = tablero.casilleroAbajoIzquierdaDe(casilleroActual)
  const mov6 = tablero.casilleroAbajoDerechaDe(casilleroActual)
  const mov7 = tablero.casilleroDerechaDe(casilleroActual)
  const mov8 = tablero.casilleroAbajoDe(casilleroActual)
		 
  const movs = #{mov1,mov2,mov3,mov4,mov5,mov6,mov7,mov8}

  // acá SOLO preguntamos si el casillero es válido (no propio, dentro del tablero, etc.)
  return movs.filter({ c =>
    c != null && self.casilleroValido(c)
  })
}

	
	
	method print() {
  if(self.esBlanco()){
    return "♚ "
  } else {return "♔ "}
}

 override method Rey() {
    return true
  }

}