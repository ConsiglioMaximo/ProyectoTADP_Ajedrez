import piezas.pieza.Pieza
import tablero.tablero
import tablero.UserException

class Caballo inherits Pieza{

    override method posiblesMovimientos() {
        const casilleroActual = self.casillero()
        if (casilleroActual == null) return #{}

        const fila = casilleroActual.posFila()
        const columna = casilleroActual.posColumna()
        const movimientos = #{}

        self.agregarMovimientoSiValido(fila + 2, columna + 1, movimientos)
        self.agregarMovimientoSiValido(fila + 1, columna + 2, movimientos)
        self.agregarMovimientoSiValido(fila - 1, columna + 2, movimientos)
        self.agregarMovimientoSiValido(fila - 2, columna + 1, movimientos)
        self.agregarMovimientoSiValido(fila - 2, columna - 1, movimientos)
        self.agregarMovimientoSiValido(fila - 1, columna - 2, movimientos)
        self.agregarMovimientoSiValido(fila + 1, columna - 2, movimientos)
        self.agregarMovimientoSiValido(fila + 2, columna - 1, movimientos)

        return movimientos
    }
}
