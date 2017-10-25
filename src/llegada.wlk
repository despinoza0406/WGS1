import WGS1.*

class Llegada {
	var posicion
	
	constructor (_posicion) {
		posicion = _posicion
	}
	
	method hittedWithsnake(direccion) { 
		game.say(snake,"Enhorabuena, lo habeis conseguido") 
	    game.stop()
	}
	
	method imagen() = "almacenaje.png"
	method posicion() = posicion
	method posicion(pos) {posicion = pos}
}