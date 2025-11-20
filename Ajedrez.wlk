class Tablero{
const casillas = #{}
const nfilas = #{0,1,2,3,4,5,6,7}
const ncolumnas = #{0,1,2,3,4,5,6,7}

method crearCasilleros(){
    nfilas.forEach({f => ncolumnas.forEach({c => casillas.add(new Casillero(posFila = f, posColumna = c))})})
}
method cantidadDeCasillas() = casillas.size()
method agregarCasilla(unaCasilla) {
  casillas.add(unaCasilla)
}

method dameElCasillero(unaFila, unaColumna) {
    var a =  casillas.filter({c => c.posFila() == unaFila})
    return (a.filter({c => c.posColumna() == unaColumna})).uniqueElement()
}
method casilleroArribaDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila() + 1 , unCasillero.posColumna())
}
method casilleroAbajoDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila() - 1 , unCasillero.posColumna())
}
method casilleroDerechaDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila()  , unCasillero.posColumna() + 1)
}
method casilleroIzquierdaDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila()  , unCasillero.posColumna() - 1)
}
method casilleroArribaDerechaDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila() + 1 , unCasillero.posColumna() + 1)
}
method casilleroArribaIzquierdaDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila() + 1 , unCasillero.posColumna() - 1)
}
method casilleroAbajoDerechaDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila() - 1 , unCasillero.posColumna() + 1)
}
method casilleroAbajoIzquierdaDe(unCasillero){
    return self.dameElCasillero(unCasillero.posFila() - 1 , unCasillero.posColumna() - 1)
}
}

class Casillero {
const property posColumna
const property posFila 

var ocupado = false

}

class Pieza{

var property casillero
var esBlanco 
method mover()

}

class Peon inherits Pieza{

override method mover() {  
    casillero = tablero.casilleroArribaDe(self.casillero())
}
}

/* --------------------------------------------------------

VER: Acá cree un objeto único que hereda del tablero y apenas arranca el programa se crean los 64 casilleros, teniendo un tablero unico para todas las piezas que vayamos creando.

object tablero inherits Tablero {

  init {
    self.crearCasilleros()
  }

}

*/
