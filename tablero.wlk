import wollok.vm.*
import casillero.Casillero
object tablero{
const casilleros = #{}
const piezas = #{}                      //SET en donde se encuentran todas las piezas del juego
const nfilas = #{0,1,2,3,4,5,6,7}
const ncolumnas = #{0,1,2,3,4,5,6,7}

// Faltaba crear los 64 casilleros cuando arranca el juego, o lo habíamos sacado a proposito jajaj

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

method agregarPieza(unaPieza) {
  piezas.add(unaPieza)
}

method piezasDe(unColor){
  return piezas.filter({p => p.esBlanco() == unColor})
}

// Acá le agregué un método que se fija si la posición que le pido está dentro del tablero

method estaDentro(fila, columna) {
    return fila >= 0 && fila <= 7 && columna >= 0 && columna <= 7
}

 method dameElCasillero(unaFila, unaColumna) {
    const a = casilleros.filter({ c => c.posFila() == unaFila && c.posColumna() == unaColumna })
    return a.uniqueElement()
  }

method casilleroArribaDe(unCasillero){
    const filaNueva = unCasillero.posFila() + 1
    const colNueva  = unCasillero.posColumna()

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
}
method casilleroAbajoDe(unCasillero){
    const filaNueva = unCasillero.posFila() - 1
    const colNueva  = unCasillero.posColumna()

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
}
method casilleroDerechaDe(unCasillero){
	const filaNueva = unCasillero.posFila()
    const colNueva  = unCasillero.posColumna() + 1

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
    //return self.dameElCasillero(unCasillero.posFila()  , unCasillero.posColumna() + 1)
}


method casilleroIzquierdaDe(unCasillero){
  const filaNueva = unCasillero.posFila()
  const colNueva  = unCasillero.posColumna() - 1

  if (!self.estaDentro(filaNueva, colNueva)) return null
  return self.dameElCasillero(filaNueva, colNueva)
}

method casilleroArribaDerechaDe(unCasillero){
	const filaNueva = unCasillero.posFila() + 1
    const colNueva  = unCasillero.posColumna() + 1

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
    //return self.dameElCasillero(unCasillero.posFila() + 1 , unCasillero.posColumna() + 1)
}
method casilleroArribaIzquierdaDe(unCasillero){
	const filaNueva = unCasillero.posFila() + 1
    const colNueva  = unCasillero.posColumna() - 1

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
    //return self.dameElCasillero(unCasillero.posFila() + 1 , unCasillero.posColumna() - 1)
}
method casilleroAbajoDerechaDe(unCasillero){
	const filaNueva = unCasillero.posFila() - 1
    const colNueva  = unCasillero.posColumna() + 1

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
    //return self.dameElCasillero(unCasillero.posFila() - 1 , unCasillero.posColumna() + 1)
}
method casilleroAbajoIzquierdaDe(unCasillero){
	const filaNueva = unCasillero.posFila() - 1
    const colNueva  = unCasillero.posColumna() - 1

    if (!self.estaDentro(filaNueva, colNueva)) return null
    return self.dameElCasillero(filaNueva, colNueva)
    //return self.dameElCasillero(unCasillero.posFila() - 1 , unCasillero.posColumna() - 1)
}
}



class UserException inherits Exception {}




