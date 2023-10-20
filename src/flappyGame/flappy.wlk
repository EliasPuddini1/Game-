import wollok.game.*
import obstacles.*

object flappy {
	
	const fallSpeed = 300
	var image = 'flappyImages/flappy.png'
	var position = game.at(6,10)
	
	method image() = image
	
	method position() { return position }
	
	method position(newPosition) { position = newPosition }
	
	method fallSpeed(score){
		
		if(score < 50){
			return fallSpeed
		}
		if(score > 79){
			return (fallSpeed * 2.5)
		}
		if(80 > score > 49){
			return (fallSpeed * 2)
		}
		else return fallSpeed
	}
	
	method initialPosition() { position = game.at(6,10) }
	
	method fall() {
		self.position(game.at(position.x(), position.y() - 1))
		image = 'flappyImages/flappy.png'
	}
	
	method fly() {
		self.position(game.at(position.x(), position.y() + 2))
		image = 'flappyImages/flappy2.png'
	}	
}
