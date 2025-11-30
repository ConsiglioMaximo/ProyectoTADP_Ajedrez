import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException

class Caballo inherits Pieza{
	
	method casilleroVaciable(casilla){
		return casilla.vacio() || (casilla.piezaBlanca() != self.esBlanco())
	}
	
	method casilleroValido(casilla){
		return tablero.estaDentro(casilla.posFila(),casilla.posColumna()) != null && self.casilleroVaciable(casilla)
	}
	
	override method posiblesMovimientos() {
		 const casilleroActual = self.casillero()
		 
		 const mov1 = tablero.dameElCasillero(casilleroActual.posFila()+2, casilleroActual.posColumna()+1)
		 const mov2 = tablero.dameElCasillero(casilleroActual.posFila()+1, casilleroActual.posColumna()+2)
		 const mov3 = tablero.dameElCasillero(casilleroActual.posFila()-1, casilleroActual.posColumna()+2)
		 const mov4 = tablero.dameElCasillero(casilleroActual.posFila()-2, casilleroActual.posColumna()+1)
		 const mov5 = tablero.dameElCasillero(casilleroActual.posFila()-2, casilleroActual.posColumna()-1)
		 const mov6 = tablero.dameElCasillero(casilleroActual.posFila()-1, casilleroActual.posColumna()-2)
		 const mov7 = tablero.dameElCasillero(casilleroActual.posFila()+1, casilleroActual.posColumna()-2)
		 const mov8 = tablero.dameElCasillero(casilleroActual.posFila()+2, casilleroActual.posColumna()-1)
		 
		 const movs= #{mov1,mov2,mov3,mov4,mov5,mov6,mov7,mov8}
		 return movs.filter({ c => self.casilleroValido(c)})
	}
	
	override method mover(unCasillero) {  
    	if(self.posiblesMovimientos().contains(unCasillero)){
        	casillero.desocupar()
        	unCasillero.ocuparCon(self)
    	}
    	else{
        	throw new UserException(message = "Movimiento invalido")
    	}
	}
}