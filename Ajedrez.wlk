import wollok.vm.*
object tablero{
const casilleros = #{}
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

class Pieza{

var property casillero = null
var property esBlanco = true

method posiblesMovimientos()

method mover(unCasillero)

}


class Peon inherits Pieza {
  var property primerMovimiento = true

  override method posiblesMovimientos() {
    const movimientos = #{}           // arranco con el set vacío
    const casilleroActual = self.casillero() // Acá me pregunto donde es que esta parada mi pieza
    const casUnoArriba = tablero.casilleroArribaDe(casilleroActual) // Le pregunto al tablero GLOBAL cual es la pieza que está arriba de mi pieza actual

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



override method mover(unCasillero) {  
    if(self.posiblesMovimientos().contains(unCasillero)){
        casillero.desocupar()
        unCasillero.ocuparCon(self)
        self.primerMovimiento(false) //faltaba el setter
    }
    else{
        throw new UserException(message = "Movimiento invalido")
    }
}
}

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

/*
Alfil: Se mueve en 4 diagonales: arriba-derecha; arriba-izquierda; abajo-derecha;
abajo-izquierda. Avanza mientras: el casillero exista (!= null), esté vacío.
Si se encuentra una pieza enemiga puede comerla (la última casilla válida en esa dirección)
pero no puede seguir de largo.
*/


class Alfil inherits Pieza {

  override method posiblesMovimientos() {
    const casActual = self.casillero()
    const movimientos = #{}    // resultado final

    // Arriba - derecha
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroArribaDerechaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Arriba - izquierda
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroArribaIzquierdaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Abajo - derecha
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroAbajoDerechaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    // Abajo - izquierda
    self.movimientosEnDireccion(casActual, { c => tablero.casilleroAbajoIzquierdaDe(c) })
      .forEach({ cas => movimientos.add(cas) })

    return movimientos
  }

  // Devuelve todos los casilleros válidos en una dirección (hasta chocar)
  method movimientosEnDireccion(casilleroInicio, paso) {
    const movimientos = #{}
    self.agregarEnDireccion(casilleroInicio, paso, movimientos)
    return movimientos
  }

  // Recorre en una dirección y va llenando el set
  method agregarEnDireccion(casilleroActual, paso, movimientos) {
    const siguiente = paso(casilleroActual)

    // 1) Si no hay más casilleros (borde) → corto
    if(siguiente == null) {
      return null
    }

    // 2) Si está vacío → lo agrego y sigo avanzando
    if(siguiente.vacio()) {
      movimientos.add(siguiente)
      self.agregarEnDireccion(siguiente, paso, movimientos)
    } else {
      // 3) Si hay pieza enemiga → la agrego pero NO sigo
      if(siguiente.piezaBlanca() != self.esBlanco()) {
        movimientos.add(siguiente)
      }
      // Si hay pieza propia, no agrego nada y corto
    }
  }

  override method mover(unCasillero) {
    if(self.posiblesMovimientos().contains(unCasillero)) {
      casillero.desocupar()
      unCasillero.ocuparCon(self)
    } else {
      throw new UserException(message = "Movimiento invalido")
    }
  }
}


class UserException inherits Exception {}





