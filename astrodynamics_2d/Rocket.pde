class Rocket {

  float x, y, width, height;
  float fuel = 100.0;
  Vector2 thurst, gravity;
  
  public Rocket(float x, float y) {
    this.x = x; // Basic attributes
    this.y = y;
    width = 4;
    height = 8;
    this.x -= width / 2; // Horizontal adjust
    
    thurst = new Vector2(0f, 0f);
    gravity = new Vector2(0f, 0f);
  }
  
  public void launch() {
    
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
    
    this.x += delta.x;
    this.y += delta.y;
  }
  
  public void draw() {
    rect(x, y - height, width, height);
  }
}
