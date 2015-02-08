class Trajectory {
  
  Vector2 periapsis = new Vector2(0f, 0f);
  float periapsisDistance = -Float.MAX_VALUE;
  
  Vector2 apoapsis = new Vector2(0f, 0f);
  float apoapsisDistance = Float.MAX_VALUE;
  
  int maxPoints = 10000;
  
  void calculate(Planet planet, Rocket rocket) {
    // Create a copy of our rocket and run the same calculations
    // on it. Use the results to draw the trajectory
    
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
    
    for (int i = 0; i < maxPoints; i++) {

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
      
      // Get the apoapsis and periapsis
      if (periapsisDistance < hypotenuse) {
        periapsis.x = r.x;
        periapsis.y = r.y;
        periapsisDistance = hypotenuse;
      } else if (apoapsisDistance > hypotenuse) {
        apoapsis.x = r.x;
        apoapsis.y = r.y;
        apoapsisDistance = hypotenuse;
      }
    }
    
    println("periapsis = " + periapsis.x + ", " + periapsis.y);
    println("apoapsis  = " + apoapsis.x  + ", " + apoapsis.y );
    periapsisDistance = -Float.MAX_VALUE;
    apoapsisDistance = Float.MAX_VALUE;
  }
  
  void draw(Planet planet, Rocket rocket) {
    
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(periapsis.x, periapsis.y, 4, 4);
    stroke(0, 0, 255);
    fill(0, 0, 255);
    ellipse(apoapsis.x, apoapsis.y, 4, 4);
    stroke(255);
    fill(255);
  }
}

