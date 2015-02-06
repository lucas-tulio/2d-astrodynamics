class Trajectory {
  
  void draw(Planet planet, Rocket rocket) {
    
    Rocket r = new Rocket(planet.x, planet.y - planet.radius / 2);
    r.x = rocket.x;
    r.y = rocket.y;
    r.gravity.x = rocket.gravity.x;
    r.gravity.y = rocket.gravity.y;
    r.thurst.x = rocket.thurst.x;
    r.thurst.y = rocket.thurst.y;
    r.speed.x = rocket.speed.x;
    r.speed.y = rocket.speed.y;
    
    stroke(255);
    fill(255);
    
    // Will simulate the whole trajectory and
    // draw it as points in space
    for (int i = 0; i < 1000; i++) {

      // Pythagoras
      float adjacent, opposite, hypotenuse = 0f;
      adjacent = Math.getSide(r.x, planet.x);
      opposite = Math.getSide(r.y, planet.y);
      hypotenuse = Math.getHypotenuse(adjacent, opposite);
      
      // Calculate gravity force and angle
      float gravitySin = adjacent / hypotenuse;
      float gravityCos = opposite / hypotenuse;
      float gravityForce = Math.getGravityForce(hypotenuse);
      r.gravity.x = gravityForce * gravitySin;
      r.gravity.y = gravityForce * gravityCos;
      
      // Update thurst vector
      if (r.enginesOn) {
        r.thurst.x = -sin(r.angle) * r.force;
        r.thurst.y = cos(r.angle) * r.force;
      } else {
        r.thurst.x = 0f;
        r.thurst.y = 0f;
      }
      
      // Sum it all up
      r.speed.x += -r.gravity.x + r.thurst.x;
      r.speed.y += -r.gravity.y + r.thurst.y;
      
      r.x += r.speed.x / 10f;
      r.y += r.speed.y / 10f;
      
      point(r.x, r.y);
      
    } 
    
    
  }
}