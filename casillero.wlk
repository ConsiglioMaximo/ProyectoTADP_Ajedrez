class Casillero {
	const property posColumna
	const property posFila 

	var property vacio = true
	var property pieza   = null

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
    pieza = null
  }
}