import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException

class Rey inherits Pieza{
	

	override method posiblesMovimientos() {
		 const casilleroActual = self.casillero()
		 
		 const mov1 = tablero.casilleroArribaDe(casilleroActual)                //Arriba
		 const mov2 = tablero.casilleroArribaDerechaDe(casilleroActual)         //Arriba Derecha
		 const mov3 = tablero.casilleroArribaIzquierdaDe(casilleroActual)       //Arriba Izquierda
		 const mov4 = tablero.casilleroIzquierdaDe(casilleroActual)             //Izquierda
		 const mov5 = tablero.casilleroAbajoIzquierdaDe(casilleroActual)        //Abajo Izquierda 
		 const mov6 = tablero.casilleroAbajoDerechaDe(casilleroActual)
		 const mov7 = tablero.casilleroDerechaDe(casilleroActual)
		 const mov8 = tablero.casilleroAbajoDe(casilleroActual)
		 
		 const movs= #{mov1,mov2,mov3,mov4,mov5,mov6,mov7,mov8}
		 return movs.filter({ c => self.casilleroValido(c) && c.esSeguroMoverseCon(self)}) 
	}
	

}