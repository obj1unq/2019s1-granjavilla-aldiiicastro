import wollok.game.*
class Maiz {
	var property esAdulta = false
	var property position
	var property image = "corn_baby.png"
	method estasSiendoRegada(){ if (not esAdulta) { esAdulta = true 
									image = "corn_adult.png"						
								}
	}
	method estasSiendoCosechada() {if (esAdulta) {game.removeVisual(self)} else {}}
	method estasSiendoVendida()  = 150
}

class Trigo {
	var property position
	var property evolucion = [0, 1, 2, 3]
	var property etapa = evolucion.first()
	var property image = "wheat_0.png"
 	method estasSiendoRegada() { evolucion.add(evolucion.first()) 
 								 evolucion.remove(evolucion.first())
 								 image = "wheat_" + evolucion.first().toString() + ".png"
 								 etapa = evolucion.first()
 	}
 	method estasSiendoCosechada() {if (evolucion.first() >= 2) {game.removeVisual(self)} else {}}
 	method estasSiendoVendida()  = (etapa - 1)*100
}

class Tomaco {
	var property position 
	method image() = "tomaco.png"
	method estasSiendoRegada() { if (position.y() != 9) {position = position.up(1)}
								 else { }
	}
	
	method estasSiendoCosechada() {game.removeVisual(self)}
	method estasSiendoVendida()  = 80
}

