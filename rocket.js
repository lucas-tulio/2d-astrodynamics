var Rocket = function() {
  
  // Basic attributes
  this.x = 0.0;
  this.y = 0.0;

  this.speedX = 0.0;
  this.speedY = 0.0;

  // Trajectory related attributes
  

  // Kill the rocket object once it leaves the screen
  rocket.checkWorldBounds = true;
  rocket.outOfBoundsKill = true;

  this.launch = function() {
    
    console.log("orbit or bust!");

    this.x = planet.x;
    this.y = planet.y;
    this.rotation = 0.0;

    // Will be useful. Maybe.
    //rocket.velocity.x = Math.cos(rocket.rotation) * this.speed;
    //rocket.velocity.y = Math.sin(rocket.rotation) * this.speed;

  }
};