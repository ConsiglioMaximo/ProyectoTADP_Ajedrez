import wollok.vm.*
import casillero.Casillero
import piezas.rey.Rey

object tablero{
const property casilleros = #{}
const piezas = #{}                      //SET en donde se encuentran todas las piezas del juego
const jugadores = #{}
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

method agregarJugador(unJugador) {
  jugadores.add(unJugador)
  
}

method sacarUnJugador(unJugador) {
  const setIntermedio = jugadores
  return setIntermedio.remove(unJugador).uniqueElement()
}

method dameUnJugador(unJugador) {
  return jugadores.find(unJugador)
}

method piezasDe(unColor){
  return piezas.filter({p => p.esBlanco() == unColor})
}

method reyDe(unColor){
  const piezasColor = self.piezasDe(unColor)
  var rey = null

  piezasColor.forEach({ p =>
    if (rey == null && p.Rey()) {
      rey = p
    }
  })

  return rey    // puede ser null si no hay rey
}

method estaEnJaque(unColor) {
  const rey = self.reyDe(unColor)
  if (rey == null) {
    return false
  }

  const casilleroRey = rey.casillero()

  const piezasEnemigas = self.piezasDe(!unColor)
  const casillerosAtacados = piezasEnemigas.flatMap({ p => p.casillerosQueAtaca() })

  return casillerosAtacados.contains(casilleroRey)
}



method movimientoEvitaJaque(pieza, casDestino, unColor) {
  const casOrigen = pieza.casillero()
  const piezaOriginalDestino = casDestino.pieza()
  const estabaVacio = casDestino.vacio()

  // aplicar movimiento simulado
  casOrigen.desocupar()
  casDestino.ocuparCon(pieza)

  // ¿sigue en jaque ese color?
  const sigueEnJaque = self.estaEnJaque(unColor)

  // deshacer simulación
  casDestino.desocupar()
  casOrigen.ocuparCon(pieza)

  if (!estabaVacio) {
    casDestino.ocuparCon(piezaOriginalDestino)
  }

  // true si este movimiento logra que el rey quede SIN jaque
  return !sigueEnJaque
}

method hayAlgunaJugadaQueEviteJaque(unColor) {
  const piezasPropias = self.piezasDe(unColor)
  var hay = false

  piezasPropias.forEach({ p =>
    if (!hay) {
      const movs = p.posiblesMovimientos()
      movs.forEach({ cas =>
        if (!hay && self.movimientoEvitaJaque(p, cas, unColor)) {
          hay = true
        }
      })
    }
  })

  return hay
}

method estaEnJaqueMate(unColor) {
  // Si no está en jaque, no puede ser jaque mate
  if (!self.estaEnJaque(unColor)) return false

  // Si no existe ninguna jugada que lo salve → jaque mate
  return !self.hayAlgunaJugadaQueEviteJaque(unColor)
}


method dame(unaPieza) {
  return piezas.find(unaPieza)
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




