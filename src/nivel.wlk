import WGS1.*
import paredes.*
import wollok.game.*
import llegada.*

object nivel1 {
	
	method cargar() {
		
//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		var posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, 0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(0, n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(ancho, n)) } // bordeDer
		
		posParedes.addAll([new Position(3,5), new Position(4,5), new Position(5,5)])
		posParedes.addAll([new Position(1,2), new Position(2,2),new Position(6,2), new Position(7,2)])
		posParedes.addAll([new Position(1,1), new Position(2,1),new Position(6,1), new Position(7,1)])
	
		var paredes = posParedes.map{p => self.dibujar(new Pared(p))}
		
		UP.onPressDo{ snake.irArriba() }
		DOWN.onPressDo{ snake.irAbajo() }
		LEFT.onPressDo{ snake.irIzquierda() }
		RIGHT.onPressDo{ snake.irDerecha() }

		R.onPressDo{ self.restart() }
		
		var llegada = [new Position(18, 18)].map{ p => self.dibujar(new Llegada(p)) }
		
		const guardias = [
		new Guardia(new Position(4, 1),[14,14,15,15,15,14],[12,13,13,12,11,11]),
		new Guardia(new Position(3, 3),[4,5,5,4,3,3],[3,3,4,4,4,3]),
		new Guardia(new Position(4, 4),[4,4,5,5,5,4],[5,6,6,5,4,4]),
		new Guardia(new Position(8, 8),[9,8,9,8,9,8],[7,8,7,8,7,8])
	]
	
	guardias.forEach{g =>
		const movement = new GuardMovement(g.posicion(),g.listaX(),g.listaY())
		g.posicion().drawElement(movement) 
		game.whenCollideDo(movement, { guard => movement.move(guard) })
		g.posicion().drawElement(g)
	}
		
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