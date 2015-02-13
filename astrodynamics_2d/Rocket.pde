class Rocket {

  float x, y, width, height;
  float fuel = 100.0;
  float angle, force;
  boolean enginesOn;
  Vector2 thrust, gravity, speed;
  
  public Rocket(float x, float y) {
    this.x = x; // Basic attributes
    this.y = y;
    width = 4;
    height = 12;
    this.x -= width / 2; // Horizontal adjust
    angle = -PI;
    
    thrust = new Vector2(0f, 0f);
    gravity = new Vector2(0f, 0f);
    speed = new Vector2(0f, 0f);
    force = 0.1f;
  }
  
  public void rotateLeft() {
    angle += -5f * PI / 180f;
  }
  public void rotateRight() {
    angle += 5f * PI / 180f;
  }
  public void toggleThrust() {
    enginesOn = !enginesOn;
  }
  
  public void update(Planet planet) {
    
    // Pythagoras
    float adjacent, opposite, hypotenuse = 0f;
    adjacent = Math.getSide(rocket.x, planet.x);
    opposite = Math.getSide(rocket.y, planet.y);
    hypotenuse = Math.getHypotenuse(adjacent, opposite);
    
    // Calculate gravity force and angle
    float gravitySin = adjacent / hypotenuse;
    float gravityCos = opposite / hypotenuse;
    float gravityForce = Math.getGravityForce(hypotenuse);
    gravity.x = gravityForce * gravitySin;
    gravity.y = gravityForce * gravityCos;
    
    // Update thrust vector
    if (enginesOn) {
      thrust.x = -sin(angle) * force;
      thrust.y = cos(angle) * force;
    } else {
      thrust.x = 0f;
      thrust.y = 0f;
    }
    
    // Sum it all up
    speed.x += -gravity.x + thrust.x;
    speed.y += -gravity.y + thrust.y;
    
    this.x += speed.x / 10f;
    this.y += speed.y / 10f;
  }
  
  public void draw(int width, int height, ParticleSystem ps) {
    
    ps.run();
    if (enginesOn) {
      ps.addParticle(new PVector(x, y), angle);
    }
    
    stroke(255);
    fill(255);
    
    pushMatrix();
    translate(x, y);
    rotate(angle);
    
    triangle(-this.width, 0, 0, this.height, this.width, 0);
    popMatrix();    
  }
}
