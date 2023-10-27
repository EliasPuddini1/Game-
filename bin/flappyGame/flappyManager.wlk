import wollok.game.*
import flappy.*
import obstacles.*

object flappyGame {
	
	var totalScore = 0
	const scoreInGame = new Score(
		position = game.at(0,23),
		image='flappyImages/flappy_score.png'
	)
	const scoreNumber = new Score(
		position = game.at(0, 23),
		image='flappyImages/score_' + totalScore.toString() + '.png'
	)

	method init() {
		game.width(25)
		game.height(25)
		game.cellSize(30)
		game.title('Flappy Bird')
	}
	
	method play() {
		game.clear()
		flappy.initialPosition()
		obstacles.resetCollection()
		self.init()
		
		// Background y Flappy
		game.addVisual(background)
		game.addVisual(flappy)
		
		// Obstacles
		obstacles.getCollection().forEach({
			obstacle => obstacle.forEach({ 
				piece => game.addVisual(piece)
			})
		})
		
		// Score
		game.addVisual(scoreInGame)
		game.addVisual(scoreNumber)

		// Events
		keyboard.w().onPressDo({ flappy.fly() })
		keyboard.up().onPressDo({ flappy.fly() })
		keyboard.down().onPressDo{flappy.falling() }
		keyboard.s().onPressDo{flappy.falling() }
		keyboard.a().onPressDo{flappy.left()}
		keyboard.left().onPressDo{flappy.left()}
		keyboard.d().onPressDo{flappy.right()}
		keyboard.right().onPressDo{flappy.right()}
		
		// Puntaje
		game.onTick(1000, 'add score', {
			totalScore = totalScore + 1
			scoreNumber.changeScoreImage(totalScore)			
		})
		
		// Creacion de los obstaculos cada 2 segundos 
		game.onTick(2000, 'obstacle appear', {
			obstacles.render()
		})
			
		// Caida del pajaro
		game.onTick(flappy.fallSpeed(totalScore), 'free fall', {
			flappy.fall()
		})
		
		// Movimiento de los obstaculos
		
		if(totalScore < 40){
			game.onTick(250, 'obstacles movement', {
				obstacles.getCollection().forEach({ 
					obstacle => obstacle.forEach({ 
						piece => obstacles.behaviour(piece)
					})
				})
			})
		}if(60>totalScore > 39){
			game.onTick(230, 'obstacles movement', {
				obstacles.getCollection().forEach({ 
					obstacle => obstacle.forEach({ 
						piece => obstacles.behaviour(piece)
					})
				})
			})
		}else{
			game.onTick(200, 'obstacles movement', {
				obstacles.getCollection().forEach({ 
					obstacle => obstacle.forEach({ 
						piece => obstacles.behaviour(piece)
					})
				})
			})
		}
	}
	
		//mostrar menu
	
	method showMenu() {
		
		const scoreOnMenu = new Score(
			position = game.origin(), 
			image='flappyImages/score_'+ totalScore.toString() +'.png'
		)
		const rain = game.sound("sounds/musica.mp3")
		rain.shouldLoop(true)
		game.clear()	
		self.init()
		game.addVisual(menu)
		game.addVisual(scoreOnMenu)
		
		keyboard.c().onPressDo({ 
			game.clear()
			obstacles.restart()
			totalScore = 0
			self.play()
		})
		
		keyboard.r().onPressDo{}
		
	}
	
	method totalScore() = totalScore
	
}

object background{
	
	var image = 'flappyImages/flappy_background.png'
	
	method image() = image
	method position() = game.origin() 
}

object menu {
	method image() = 'flappyImages/flappy_menu2.png'
	method position() = game.origin()
}

class Score {
	var property position
	var property image

	method position() = position
	method position(newPosition) = { position = newPosition } 
	method changeScoreImage(newScore) {
		image = 'flappyImages/score_' + newScore + '.png'
	}
}