import WGS1.*
import paredes.*
import wollok.game.*
import llegada.*

class Nivel {
	
	const ancho = game.width() - 1
	const largo = game.height() - 1
	
	var posParedes = []
	
	var guardias = []
	
	method cargar() {
		
		//	PAREDES
		
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, 0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(0, n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(ancho, n)) } // bordeDer
		
		UP.onPressDo{ snake.irArriba() }
		DOWN.onPressDo{ snake.irAbajo() }
		LEFT.onPressDo{ snake.irIzquierda() }
		RIGHT.onPressDo{ snake.irDerecha() }

		R.onPressDo{ self.restart() }
	}
	
	method moveGuards() {
		guardias.forEach({g =>
			const movement = new GuardMovement(g.posicion(),g.listaX(),g.listaY())
			g.posicion().drawElement(movement) 
			game.whenCollideDo(movement, { guard => movement.move(guard) })
			g.posicion().drawElement(g)
		})
	}
	
	method restart() {
		game.clear()
		self.cargar()
	}
			
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}

object nivel1 inherits Nivel {
	
	override method cargar() {
		super()
		

		posParedes.addAll([new Position(2,1), new Position(2,2), new Position(2,3),new Position(2,4),new Position(1,6),new Position(2,6)])
		posParedes.addAll([new Position(3,4), new Position(4,4), new Position(4,5),new Position(5,5),new Position(5,6),new Position(6,6)])
		posParedes.addAll([new Position(6,7), new Position(6,8), new Position(6,9),new Position(6,10),new Position(2,7),new Position(3,7)])
		posParedes.addAll([new Position(6,10), new Position(6,11), new Position(6,12),new Position(5,12),new Position(4,12),new Position(3,12)])
		posParedes.addAll([new Position(3,10), new Position(2,8), new Position(2,9),new Position(2,10),new Position(3,8),new Position(3,9)])
		posParedes.addAll([new Position(4,10), new Position(2,12), new Position(2,13),new Position(2,14),new Position(2,15),new Position(2,16)])
		posParedes.addAll([new Position(3,16), new Position(4,16), new Position(5,16),new Position(6,16),new Position(7,16),new Position(8,16)])
		posParedes.addAll([new Position(9,16), new Position(10,16), new Position(11,16),new Position(12,16),new Position(13,16),new Position(14,16)])
		posParedes.addAll([new Position(16,17), new Position(16,16), new Position(16,15),new Position(16,14),new Position(16,13),new Position(16,12)])
		posParedes.addAll([new Position(15,14), new Position(14,14), new Position(13,14),new Position(12,14),new Position(11,14),new Position(10,14)])
		posParedes.addAll([new Position(14,12), new Position(13,12), new Position(12,12),new Position(11,12),new Position(10,12),new Position(9,12)])
		posParedes.addAll([new Position(8,12), new Position(8,11), new Position(8,10),new Position(9,10),new Position(10,10),new Position(11,10)])
		posParedes.addAll([new Position(12,10), new Position(13,10), new Position(14,10),new Position(15,10),new Position(16,10),new Position(16,11)])
		posParedes.addAll([new Position(9,14), new Position(8,14), new Position(6,14),new Position(5,14),new Position(4,14),new Position(3,14)])
		posParedes.addAll([new Position(14,9), new Position(14,8), new Position(14,7),new Position(14,6),new Position(14,4),new Position(14,3)])
		posParedes.addAll([new Position(13,6), new Position(12,6), new Position(11,6),new Position(10,6),new Position(9,6),new Position(8,6)])
		posParedes.addAll([new Position(7,4), new Position(7,3), new Position(7,2),new Position(6,2),new Position(5,2),new Position(4,2)])
		posParedes.addAll([new Position(8,3), new Position(9,3), new Position(10,3),new Position(11,3),new Position(12,3),new Position(14,1)])
		posParedes.addAll([new Position(8,8), new Position(9,8), new Position(10,8),new Position(11,8),new Position(12,8),new Position(16,1)])
		posParedes.addAll([new Position(16,2), new Position(16,3), new Position(16,4),new Position(16,5),new Position(16,6),new Position(16,7)])
	
		var paredes = posParedes.map{p => self.dibujar(new Pared(p))}
		
		var llegada = [new Position(17, 17)].map{ p => self.dibujar(new Llegada(p)) }
		
		guardias = guardias+[
		new Guardia(new Position(4, 7),[5,5,5,4,4,4],[7,8,9,9,8,7]),new Guardia(new Position(1, 9),[1,1,1,1,1,1],[10,11,12,11,10,9]),
		new Guardia(new Position(14, 5),[14],[5]),new Guardia(new Position(13, 5),[13,13,13,14,15,15,15,15,13],[4,3,2,2,2,3,4,5,5]),
		new Guardia(new Position(7, 13),[8,9,8,7,6,5,6,7],[13,13,13,13,13,13,13,13]),
		new Guardia(new Position(7, 8),[7],[8])
		]
		
		self.moveGuards()
		
		}
}	

	

