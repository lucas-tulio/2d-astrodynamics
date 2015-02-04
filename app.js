console.log("init");

var GameState = function(game) {

};

//
// Setup
//
GameState.prototype.create = function() {

  // Set stage background color
  this.game.stage.backgroundColor = 0x000;
  this.speed = 800; // pixels/second
  this.GRAVITY = 980; // pixels/second/second

  // Define constants
  this.SHOT_DELAY = 1000;
  this.NUMBER_OF_rocketS = 3;

  // Create an object representing our platform
  this.platform = this.game.add.sprite(this.game.width / 2, this.game.height / 2, 'rocket');

  // Set the pivot point to the center of the platform
  this.platform.anchor.setTo(0.5, 0.5);

  // Create an object pool of rockets
  this.rocketPool = this.game.add.group();
  for(var i = 0; i < this.NUMBER_OF_rocketS; i++) {

    // Create each rocket and add it to the group.
    var rocket = this.game.add.sprite(0, 0, 'rocket');
    this.rocketPool.add(rocket);

    // Set its pivot point to the center of the rocket
    rocket.anchor.setTo(0.5, 0.5);

    // Enable physics on the rocket
    this.game.physics.enable(rocket, Phaser.Physics.ARCADE);

    // Set its initial state to "dead".
    rocket.kill();
  }

  // Turn on gravity
  game.physics.arcade.gravity.y = this.GRAVITY;

  // Create a group for explosions
  this.explosionGroup = this.game.add.group();

  // Simulate a pointer click/tap input at the center of the stage
  // when the example begins running.
  this.game.input.activePointer.x = this.game.width/2;
  this.game.input.activePointer.y = this.game.height/2 - 100;
};

GameState.prototype.shootrocket = function() {

  // Launch delay
  if (this.lastrocketShotAt === undefined) this.lastrocketShotAt = 0;
  if (this.game.time.now - this.lastrocketShotAt < this.SHOT_DELAY) return;
  this.lastrocketShotAt = this.game.time.now;

  // Get a dead rocket from the pool
  var rocket = this.rocketPool.getFirstDead();

  // If there aren't any rockets available then don't shoot
  if (rocket === null || rocket === undefined) return;

  // Revive the rocket
  // This makes the rocket "alive"
  rocket.revive();

  // Kill the rocket object once it leaves the screen
  rocket.checkWorldBounds = true;
  rocket.outOfBoundsKill = true;

  // Set the rocket position to the platform position.
  rocket.reset(this.platform.x, this.platform.y);
  rocket.rotation = this.platform.rotation;

  // Shoot it in the right direction
  rocket.body.velocity.x = Math.cos(rocket.rotation) * this.speed;
  rocket.body.velocity.y = Math.sin(rocket.rotation) * this.speed;
};

//
// Update
//
GameState.prototype.update = function() {

  // Rotate all living rockets to match their trajectory
  this.rocketPool.forEachAlive(function(rocket) {
    rocket.rotation = Math.atan2(rocket.body.velocity.y, rocket.body.velocity.x);
  }, this);

  // Aim the platform at the pointer.
  // All this function does is calculate the angle using
  // Math.atan2(yPointer-yplatform, xPointer-xplatform)
  this.platform.rotation = this.game.physics.arcade.angleToPointer(this.platform);

  // Shoot a rocket
  if (this.game.input.activePointer.isDown) {
    this.shootrocket();
  }
};

var game = new Phaser.Game(640, 640, Phaser.AUTO, 'game');
game.state.add('game', GameState, true);
