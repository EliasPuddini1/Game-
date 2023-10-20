import wollok.game.*
import flappyGame.flappyManager.flappyGame

 object gameManager {
 	const cellsize = 30 // pixeles
	const height = 25 // en celdas
	const width = 25 // en celdas
	
	const piecelen = 120 // pixeles de ancho de cada piecita (15puzzle)
 	
 	method inicializar() {
		game.cellSize(cellsize)
		game.height(height)
		game.width(width)
		game.boardGround("img/fondo.png")
		game.title("PIGames")
 		//hace la mezcla acá, es mucho más rápido para iniciarlo
 	}
 }