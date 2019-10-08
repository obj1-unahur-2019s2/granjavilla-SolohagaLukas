import wollok.game.*
import direcciones.*

object oso {
	var property position = new Position(x = 3, y = 7)
	
	method image() = "oso.jpg"

	method moverEnDireccion(direccion) {
		self.position(direccion.siguientePosicion(self.position()))
	}	
	
}
