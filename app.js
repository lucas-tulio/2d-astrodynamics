console.log("init");

var GameState = function(game) {

};

//
// Setup
//
GameState.prototype.create = function() {

  // Set stage background color
  this.game.stage.backgroundColor = 0x000;
  this.GRAVITY = 9.8;

  // Create our objects
  var planet = this.game.add.sprite(this.game.width / 2, this.game.height / 2, 'rocket');
  var rocket = this.game.add.sprite(0, 0, 'rocket');

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
