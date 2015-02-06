class Rocket {

  float x, y, width, height;
  float fuel = 100.0;
  float angle, force;
  Vector2 thurst, gravity, speed;
  boolean enginesOn;
  
  public Rocket(float x, float y) {
    this.x = x; // Basic attributes
    this.y = y;
    width = 4;
    height = 8;
    this.x -= width / 2; // Horizontal adjust
    
    thurst = new Vector2(0f, 0f);
    gravity = new Vector2(0f, 0f);
    speed = new Vector2(0f, 0f);
    force = 1f;
  }
  
  public void rotateLeft() {
    angle += -5f * PI / 180f;
  }
  public void rotateRight() {
    angle += 5f * PI / 180f;
  }
  public void thurst() {
    enginesOn = true;
  }
  public void stop() {
    enginesOn = false;    
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
    
    // Update thurst vector
    if (enginesOn) {
      thurst.x = -sin(angle) * force;
      thurst.y = cos(angle) * force;
    } else {
      thurst.x = 0f;
      thurst.y = 0f;
    }
    
    // Sum it all up
    //delta.x = -gravity.x + thurst.x;
    //delta.y = -gravity.y + thurst.y;
    speed.x += thurst.x;
    speed.y += thurst.y;
    
    this.x += thurst.x;
    this.y += thurst.y;
  }
  
  public void draw(int width, int height) {
    
    if (enginesOn) {
      stroke(0, 255, 0);
      fill(0, 255, 0);
    } else {
      stroke(255);
      fill(255);
    }
    
    pushMatrix();
    translate(x, y);
    rotate(angle);
    
    triangle(-this.width, 0, 0, this.height, this.width, 0);
    popMatrix();    
    
    stroke(255);
    fill(255);
  }
}
