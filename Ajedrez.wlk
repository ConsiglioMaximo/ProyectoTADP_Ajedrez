import wollok.vm.*
object tablero{
const casilleros = #{}
const nfilas = #{0,1,2,3,4,5,6,7}
const ncolumnas = #{0,1,2,3,4,5,6,7}

method crearCasilleros(){
    nfilas.forEach({f => ncolumnas.forEach({c => casilleros.add(new Casillero(posFila = f, posColumna = c))})})
}
method cantidadDeCasilleros() = casilleros.size()

method agregarCasilla(unaCasilla) {
  casilleros.add(unaCasilla)
}

method dameElCasillero(unaFila, unaColumna) {
    const a =  casilleros.filter({c => c.posFila() == unaFila})
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

var property vacio = true
var pieza   = null

  method ocuparCon(unaPieza) {
    vacio = false
    pieza = unaPieza
    unaPieza.casillero(self)
  }

  method desocupar() {
    vacio = true
    pieza = null
  }
}

class Pieza{

var property casillero
var esBlanco = true

method posiblesMovimientos()

method mover(unCasillero)

}

class Peon inherits Pieza{
var property primerMovimiento = true

override method posiblesMovimientos(){
    var setIntermedio
    if(primerMovimiento){
        if(tablero.casilleroArribaDe(self.casillero()).vacio()){
            setIntermedio = #{tablero.casilleroArribaDe(self.casillero()),tablero.casilleroArribaDe(tablero.casilleroArribaDe(self.casillero()))}
        }
    }
    else{
        setIntermedio = #{tablero.casilleroArribaDe(self.casillero())}
    }
    return setIntermedio.filter({c => c.vacio()})
        
}

override method mover(unCasillero) {  
    self.primerMovimiento(false)
    if(self.posiblesMovimientos().contains(unCasillero)){
        casillero.desocupar()
        unCasillero.ocuparCon(self)
    }
    else{
        throw new UserException(message = "Movimiento invalido")
    }
}
}

class UserException inherits Exception {}
