class Rocket {
  int x, y, width, height;
  int planetRadius;
  
  public Rocket(int x, int y, int planetRadius) {
    this.x = x;
    this.y = y;
    width = 4;
    height = 8;
    this.planetRadius = planetRadius;
  }
  
  public void launch() {
    
  }
  
  public void update() {
    
  }
  
  public void draw() {
    rect(x - (width / 2), y - height - (planetRadius / 2), width, height);
  }
}
