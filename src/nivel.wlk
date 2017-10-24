import WGS1.*
import paredes.*
import wollok.game.*

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