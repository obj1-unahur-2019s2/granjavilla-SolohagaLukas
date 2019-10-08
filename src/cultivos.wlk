class Maiz {
	var property position
	var property esAdulta = false
	
	method image() {
		if (esAdulta) {
			return "corn_adult.png"
		} else {
			return "corn_baby.png"
		}
	}
	
	method regate() {
		if (not esAdulta) { esAdulta = true }
	}
	method teChocoElOsos() {
			self.regate()
	}
	method precio() { return 150 }
}
class Trigo {
	var property position
	var etapa = 0.max(0)
	
	method image() {
		if (etapa == 0) { return "wheat_0.png" } 
		else if (etapa == 1) {return "wheat_1.png"}
		else if (etapa == 2) {return "wheat_2.png"}
		else {return "wheat_3.png"}
	}
	
	method regate() { 
		if (etapa == 0) { etapa = 1 }
		else if(etapa == 1) { etapa = 2 }
		else if(etapa == 2) { etapa = 3 }
		else {etapa = 0}
	}
	method teChocoElOso() {
		if (position.x() > 0) {
			position = position.left(1)
		}
	}
	method precio() {
		return (etapa - 1) * 100
	}
}

class Tomaco {
	var property position
	
	method image() { return "tomaco.png" }
	method regate() { self.position().up(1) }
	method precio() { return 80 }
	method teChocoElOso() {	}
}