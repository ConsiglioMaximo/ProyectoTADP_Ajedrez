import wollok.vm.*
object tablero{
const casilleros = #{}
const nfilas = #{0,1,2,3,4,5,6,7}
const ncolumnas = #{0,1,2,3,4,5,6,7}

// Faltaba crear los 64 casilleros cuando arranca el juego, o lo habíamos sacado a proposito jajaj
init {
    self.crearCasilleros()
}

 method crearCasilleros() {
    nfilas.forEach({ f => 
      ncolumnas.forEach({ c => 
        casilleros.add(new Casillero(posFila = f, posColumna = c))
      })
    })
  }

method cantidadDeCasilleros() = casilleros.size()

method agregarCasilla(unaCasilla) {
  casilleros.add(unaCasilla)
}

// Acá le agregué un método que se fija si la posición que le pido está dentro del tablero

method estaDentro(fila, columna) {
    return fila >= 0 && fila <= 7 && columna >= 0 && columna <= 7
}

 method dameElCasillero(unaFila, unaColumna) {
    const a = casilleros.filter({ c => c.posFila() == unaFila && c.posColumna() == unaColumna })
    return a.uniqueElement()
  }

/*
Ojo que después de agregarle la validación de la posición, habría que cambiar los method que miran el perímetro del casillero donde estoy parado
Sería algo así, me devuelve el casillero solo si existe, sino existe te tira un null y no un error feo: 


 method casilleroArribaDe(unCasillero) {
    const filaNueva = unCasillero.posFila() + 1
    const colNueva  = unCasillero.posColumna()

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
  }

// Este lo probé y anda flama.

*/

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
    unaPieza.casillero = self // acá el setter estaba mal
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

/* PROPONGO

class Peon inherits Pieza {
  var property primerMovimiento = true

  override method posiblesMovimientos() {
    const movimientos = #{}           // arranco con el set vacío
    const casilleroActual = self.casillero() // Acá me pregunto donde es que esta parada mi pieza
    const casUnoArriba = tablero.casilleroArribaDe(casActual) // Le pregunto al tablero GLOBAL cual es la pieza que está arriba de mi pieza actual

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

*/

override method mover(unCasillero) {  
    self.primerMovimiento(false)
    if(self.posiblesMovimientos().contains(unCasillero)){
        casillero.desocupar()
        unCasillero.ocuparCon(self)
        self.primerMovimiento = false //faltaba el setter
    }
    else{
        throw new UserException(message = "Movimiento invalido")
    }
}
}

class UserException inherits Exception {}

