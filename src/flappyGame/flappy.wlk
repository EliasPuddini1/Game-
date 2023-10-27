import wollok.game.*
import obstacles.*

object flappy {
	
	var fallSpeed = 300
	var image = 'flappyImages/flappy.png'
	var position = game.at(6,10)
	
	method image() = image
	
	method position() { return position }
	
	method position(newPosition) { position = newPosition }
	
	method fallSpeed(score){
		
		if(score < 20){
			return fallSpeed
		}
		if(30 > score > 19){
			return (fallSpeed * 2)
		}
		if(45 >score > 29){
			return (fallSpeed * 2.5)
		}
		if(60>score>44){
			
			self.setFallSpeed(fallSpeed*3)
			return(fallSpeed)
		}
		if(score >59){
			
			return(fallSpeed*score)
		}
		
		else return fallSpeed
	}
	
	method initialPosition() { position = game.at(6,10) }
	
	method fall() {
		self.position(game.at(position.x(), position.y() - 1))
		image = 'flappyImages/flappy.png'
	}
	
	method falling(){
		self.position(game.at(position.x(), position.y() - 2))
		image = 'flappyImages/flappy2.png'
	}
	
	method left(){
		self.position(game.at(position.x() - 2, position.y()))
		image = 'flappyImages/flappy2.png'
	}
	
	method right(){
		self.position(game.at(position.x() + 2, position.y()))
		image = 'flappyImages/flappy2.png'
	}
	
	method fly() {
		self.position(game.at(position.x(), position.y() + 2))
		image = 'flappyImages/flappy2.png'
	}
	
	method setFallSpeed(score){
		fallSpeed = score
	}
}
