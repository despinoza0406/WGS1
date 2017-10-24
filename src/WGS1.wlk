import paredes.*
import direcciones.*
import paredes.*

class Posicionable {
	var posicion
	constructor(p) { posicion = p }
	
	method posicion() = posicion
	method posicion(_posicion) { posicion = _posicion }
}

class Guardia inherits Posicionable {
	
	constructor(_posicion) = super(_posicion) {

	}
	method imagen() = "cherry.png"
	method hittedWithsnake(wakman) {
		snake.hittedWithguard(self)
	}
	
}

object snake inherits Posicionable(new Position(11, 11)) {
	var direccion = arriba
	
	method imagen() {
		return "Wsnake.png"
	}
	
	method hittedWith(something) {
		try
			something.hittedWithsnake(direccion)
		catch e : Exception {
			console.println("asd")
			console.println(e)
			self.retrocede()
		}
	}
	method hittedWithguard(ghost) {
		game.say(self, "You lose!")
		self.posicion().x(12)
		self.posicion().y(11)
	}
	
	method retrocede() {
		direccion.opuesto().move(posicion)
	}

	method irArriba() {
		direccion = arriba
		self.avanzar()
	}

	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	
	method avanzar() {
		direccion.move(posicion)
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
	
	
}

class GuardMovement {
	var timeCounter = 0
	var move = 1
	const posicion
	
	constructor(p) { posicion = p }
	
	method move(ghost) {
		timeCounter++
		if (timeCounter > 2) {			
			posicion.moveRight(move)
			move = -move
			timeCounter = 0
		}
	}
	
	method hittedWithsnake(wak) { }
	
	method image() = "ground.png"
}
