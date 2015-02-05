class Rocket {

  float x, y, width, height;
  float fuel = 100.0;
  float angle, force;
  Vector2 thurst, gravity;
  boolean enginesOn;
  
  public Rocket(float x, float y) {
    this.x = x; // Basic attributes
    this.y = y;
    width = 2;
    height = 2;
    this.x -= width / 2; // Horizontal adjust
    
    thurst = new Vector2(0f, 0f);
    gravity = new Vector2(0f, 0f);
  }
  
  public void rotateLeft() {
    angle += -5f * PI / 180f;
  }
  public void rotateRight() {
    angle += 5f * PI / 180f;
  }
  public void thurst() {
    enginesOn = true;
    thurst.x = sin(angle);
    thurst.y = cos(angle);
  }
  public void stop() {
    enginesOn = false;
    thurst.x = 0f;
    thurst.y = 0f;
  }
  
  public void update(Planet planet) {
    
    Vector2 delta = new Vector2(0f, 0f);
    
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
    
    // Sum it all up
    delta.x = -gravity.x + thurst.x;
    delta.y = -gravity.y + thurst.y;
    
    this.x += delta.x / 10f;
    this.y += delta.y / 10f;
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
      rotate(angle);
      triangle(this.x - this.width, this.y, this.x, this.y - this.height, this.x + this.width, this.y);
    popMatrix();
    
    stroke(255);
    fill(255);
  }
}
