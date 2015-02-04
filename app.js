console.log("init");

var GameState = function(game) {

};

//
// Setup
//
GameState.prototype.create = function() {

  // Set stage background color
  this.game.stage.backgroundColor = 0x000;
  
  // Gravitational constant
  this.G = 6.67 * Math.pow(10, -11);

  // Create our objects
  //var planet = this.game.add.sprite(0, 0, 'rocket');
  //var rocket = this.game.add.sprite(0, 0, 'rocket');

  var planet = new Planet(this.game.width / 2, this.game.height / 2);

};

//
// Update
//
GameState.prototype.update = function() {

  // If click, launch the rocket
  if (this.game.input.activePointer.isDown) {
    rocket.launch();
  }
};

var game = new Phaser.Game(640, 640, Phaser.AUTO, 'game');
game.state.add('game', GameState, true);
