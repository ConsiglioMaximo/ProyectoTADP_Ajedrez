import tablero.*
import piezas.vacio.nada

class Casillero {
	const property posColumna
	const property posFila 

	var property vacio = true
	var property pieza   = nada

 method piezaBlanca() {
  return !vacio && pieza.esBlanco()
}
  
  method ocuparCon(unaPieza) {
    vacio = false
    pieza = unaPieza
    unaPieza.casillero(self) 
  }

  method desocupar() {
    vacio = true
    pieza = nada
  }

method esSeguroMoverseCon(unaPieza){
  const color = unaPieza.esBlanco()
  const piezasEnemigas = tablero.piezasDe(!color)
  const casillerosAtacados = piezasEnemigas.flatMap({ p => p.casillerosQueAtaca() })
  return !casillerosAtacados.contains(self)
}

}
