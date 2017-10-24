
class Direccion {
	method posicionDeAlLado(posicion) {
		const nuevaPos = posicion.clone()
		self.move(nuevaPos)
		return nuevaPos
	}
	
	method move(posicion)
}

object izquierda inherits Direccion { 
	override method move(position) { position.moveLeft(1) } 
	method opuesto() = derecha
}

object derecha inherits Direccion { 
	override method move(position) { position.moveRight(1) } 
	method opuesto() = izquierda
}

object abajo inherits Direccion { 
	override method move(position) { position.moveDown(1) } 
	method opuesto() = arriba
}

object arriba inherits Direccion { 
	override method move(position) { position.moveUp(1) } 
	method opuesto() = abajo
}
