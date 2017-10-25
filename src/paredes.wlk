import WGS1.*

class Pared {
	var posicion
	
	constructor(_posicion) {
		posicion = _posicion
	}
	
	method puedePisarte(_) = false
	
	method imagen() = "ladrillo2.png"
	method getPosicion() = posicion
	method setPosicion(pos) {posicion = pos}
	method hittedWithsnake(wakman) {
		throw new Exception("No puedes mover las paredes.")
	}
}