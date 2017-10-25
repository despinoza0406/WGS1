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
	var listaX
	var listaY
	constructor(_posicion,x,y) = super(_posicion) {
		listaX = x
		listaY = y
	}
	method imagen() = "Guard.png"
	method hittedWithsnake(wakman) {
		snake.hittedWithguard(self)
	}
	method listaX(){
		return listaX
	}
	method listaY(){
		return listaY
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
	var listaX
	var listaY
	var positionCounter = 0
	
	constructor(p,x,y) {
		posicion = p
		listaX = x
		listaY = y
	}
	
	method move(ghost) {
		timeCounter++
		if (timeCounter > 2) {			
			posicion.x(listaX.get(positionCounter))
			posicion.y(listaY.get(positionCounter))
			move = -move
			timeCounter = 0
			positionCounter++
		}
		if(positionCounter == listaX.size()){
				positionCounter = 0
		}
		
	}
	
	method hittedWithsnake(wak) { }
	
	method image() = "metalwall.png"
}
