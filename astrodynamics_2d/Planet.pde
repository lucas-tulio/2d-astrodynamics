class Planet {
  float x, y, radius, mass;
  
  public Planet(float x, float y, float radius, float mass) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.mass = mass;
  }
  
  public void draw() {
    ellipse(x, y, radius * 2, radius * 2);
  }
}
