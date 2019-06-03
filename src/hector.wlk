import wollok.game.*
import especies.*
object hector {
	var property paraVender = []
	var property cuantoOroTengo = 0
	var property position = game.at(0,0)
	method move(nuevaPosicion) {position = nuevaPosicion}
	method image() = "player.png"
	method sembar(especie) {
		if (not self.hayCultivos()) {
			game.addVisual(especie)
		}
	}
	method regar() {
		if (self.hayCultivos()) 
		{ game.colliders(self).forEach({especie => especie.estasSiendoRegada()}) }
		else game.say(self, "No hay especies")
	}
	method cosechar() {if (self.hayCultivos()) 
		{ 
			paraVender += game.getObjectsIn(self.position())
			paraVender.remove(self)
			game.colliders(self).forEach({especie => especie.estasSiendoCosechada()}) 
		}
		else game.say(self, "No hay especies")}
	method vender() {
		cuantoOroTengo += paraVender.sum{especie => especie.estasSiendoVendida()}
		paraVender = []
	}
	
	method cuantoOroYPlantasTengo() {
		game.say(self, "Tengo " + cuantoOroTengo.toString() + " monedas, y " + paraVender.size().toString() + " plantas para vender")
	}
	
	method hayCultivos() = not game.colliders(self).isEmpty()
	
}
