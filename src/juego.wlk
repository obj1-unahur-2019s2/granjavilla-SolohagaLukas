import wollok.game.*
import cultivos.*
import hector.*
import oso.*
import direcciones.*

object juegoGranja {
	var personajeActual = hector
	//var elOsoSeMueve = false
	
	method configurarTeclado() {
		keyboard.s().onPressDo({game.say(hector, "hola gente")})
		//keyboard.o().onPressDo({hector.position(new Position(x = 0, y = 0))})
 		keyboard.m().onPressDo({ hector.plantarMaiz() })
 		keyboard.t().onPressDo({ hector.plantarTrigo() })
 		keyboard.o().onPressDo({ hector.plantarTomaco() })
 		keyboard.r().onPressDo({ hector.regarPlanta() })
 		keyboard.c().onPressDo({ hector.cosecharPlanta() })
 		keyboard.v().onPressDo({ hector.vender() })
		keyboard.p().onPressDo({
 		game.say(hector,
 			"tengo cosechadas" + hector.cantidadDePlantasCosechadas() + "plantas")
 		})	
 		keyboard.space().onPressDo({ game.say(hector, 
 		"tengo " + hector.monedas() + " monedas y " + hector.cantidadDePlantasCosechadas() + " plantas para vender") })
		self.configurarMovimientos()
	}
	
	method configurarMovimientos() {
		keyboard.up().onPressDo({
			if (personajeActual.position().y() < game.height() - 1) {
				personajeActual.position(personajeActual.position().up(1))
			}
		})
		keyboard.down().onPressDo({
			if (personajeActual.position().y() > 0) {
				personajeActual.position(personajeActual.position().down(1))
			}
		})
		keyboard.right().onPressDo({
			if (personajeActual.position().x() < game.width() - 1) {
				personajeActual.position(personajeActual.position().right(1))
			}
		})
		keyboard.left().onPressDo({
			if (personajeActual.position().x() > 0) {
				personajeActual.position(personajeActual.position().left(1))
			}
		})
	}
	
	method configurarPersonajes() {
		game.addVisual(hector)
		game.addVisual(oso)
	}
	
	method configurarColisiones() {
		game.whenCollideDo(oso, { objeto => objeto.teChocoElOso() })
	}
	
	method configurarAcciones() {
		//El oso se mueve siempre para el este
		//game.onTick(1000, "movimientoOso", {oso.moverEnDireccion(este)})
		
		//El oso se mueve aleatorio para algún lado: norte, sur, este, oeste
		game.onTick(1000, "movimientoOso", {
			var dado = (1..1).map({n => 0.randomUpTo(4).truncate(0)})
			
			if (dado == 0 and oso.position().y() < game.height() - 1) {
				oso.position(oso.position().up(1))
			} else if (dado == 1 and oso.position().y() > 0) {
				oso.position(oso.position().down(1))
			} else if (dado == 2 and oso.position().x() > 0) {
				oso.position(oso.position().left(1))
			} else if (dado == 2 and oso.position().x() < game.width() - 1) {
				oso.position(oso.position().right(1))
			}
		})
	}
}