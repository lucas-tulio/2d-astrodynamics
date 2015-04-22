class Space {
  Vector2[] stars;
  
  public Space(int numStars) {
    stars = new Vector2[numStars];
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Vector2(random(0, width), random(0, height));
    }
  }
  
  void draw() {
    fill(255);
    stroke(255);
    for (int i = 0; i < stars.length; i++) {
      point(stars[i].x, stars[i].y);
    }
  }
}
