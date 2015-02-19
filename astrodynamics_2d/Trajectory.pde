class Trajectory {

  Vector2 periapsis = new Vector2(0f, 0f);
  float periapsisDistance = 100000f;
  Vector2 apoapsis = new Vector2(0f, 0f);
  float apoapsisDistance = -100000f;

  int drawEvery, maxPoints;
  boolean invertDrawing;
  
  float textOffsetX = 4f;
  float textOffsetY = -2f;
  
  public Trajectory(int drawEvery, int maxPoints) {
    this.drawEvery = drawEvery;
    this.maxPoints = maxPoints;
  }

  void calculateAndDraw(Planet[] planets, Rocket rocket) {

    // Create a copy of our rocket and run the same calculations
    // on it. Use the results to draw the trajectory

    Rocket r = new Rocket(0f, 0f);
    r.x = rocket.x;
    r.y = rocket.y;
    r.gravity.x = rocket.gravity.x;
    r.gravity.y = rocket.gravity.y;
    r.thrust.x = rocket.thrust.x;
    r.thrust.y = rocket.thrust.y;
    r.speed.x = rocket.speed.x;
    r.speed.y = rocket.speed.y;

    float startingAngle;

    stroke(255);
    fill(255);

    for (int i = 0; i < maxPoints; i++) {
      for (int j = 0; j < planets.length; j++) {
        // Pythagoras
        float adjacent, opposite, hypotenuse = 0f;
        adjacent = Math.getSide(r.x, planets[j].x);
        opposite = Math.getSide(r.y, planets[j].y);
        hypotenuse = Math.getHypotenuse(adjacent, opposite);
  
        // Calculate gravity force and angle
        float gravitySin = adjacent / hypotenuse;
        float gravityCos = opposite / hypotenuse;
        float gravityForce = Math.getGravityForce(hypotenuse);
        r.gravity.x = gravityForce * gravitySin;
        r.gravity.y = gravityForce * gravityCos;
  
        // Update thrust vector
        if (r.enginesOn) {
          r.thrust.x = -sin(r.angle) * r.force;
          r.thrust.y = cos(r.angle) * r.force;
        } else {
          r.thrust.x = 0f;
          r.thrust.y = 0f;
        }
  
        // Sum it all up
        r.speed.x += -r.gravity.x + r.thrust.x;
        r.speed.y += -r.gravity.y + r.thrust.y;
  
        r.x += r.speed.x / 10f;
        r.y += r.speed.y / 10f;
      
        // Get the apoapsis and periapsis
        if (periapsisDistance > hypotenuse) {
          periapsis.x = r.x;
          periapsis.y = r.y;
          periapsisDistance = hypotenuse;
        } else if (apoapsisDistance < hypotenuse) {
          apoapsis.x = r.x;
          apoapsis.y = r.y;
          apoapsisDistance = hypotenuse;
        }

        if (i % drawEvery == 0) {
          point(r.x, r.y);
        }
      }
    }

    periapsisDistance = 100000f;
    apoapsisDistance = -100000f;
  }

  void draw(Planet planet, Rocket rocket) {
  
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(periapsis.x, periapsis.y, 4, 4);
    text("Pe", periapsis.x + textOffsetX, periapsis.y + textOffsetY);
    stroke(0, 0, 255);
    fill(0, 0, 255);
    ellipse(apoapsis.x, apoapsis.y, 4, 4);
    text("Ap", apoapsis.x + textOffsetX, apoapsis.y + textOffsetY);
    
    stroke(255);
    fill(255);
  }
}

