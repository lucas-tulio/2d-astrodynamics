class Planet {
  int x, y, radius, mass;
  
  public Planet(int x, int y, int radius, int mass) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.mass = mass;
  }
  
  public void draw() {
    ellipse(x, y, radius, radius);
  }
}
