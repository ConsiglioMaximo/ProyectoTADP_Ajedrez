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
    unaPieza.casillero(self) // acá el setter estaba mal
  }

  method desocupar() {
    vacio = true
    pieza = nada
  }

  method esSeguroMoverseCon(unaPieza){
    const color = unaPieza.esBlanco()
    const piezasEnemigas = tablero.piezasDe(!color)
    var movimientosEnemigos = #{}
    movimientosEnemigos = (piezasEnemigas.flatMap({p => p.posiblesMovimientos()}))
    return !(movimientosEnemigos.contains(self))
  }
}
