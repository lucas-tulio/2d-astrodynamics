static class Math {
  
  /**
  * Returns the distance to the Planet's surface
  */
  static double distanceToSurface(Rocket rocket, Planet planet) {
    return 0.0;
  }
  
  /**
  * Given two sides of a square triange, return the hypotenuse
  */
  private double getHypotenuse(int adjacent, int opposite) {
    return sqrt((pow(adjacent, 2) + pow(opposite, 2)));
  }

  /**
  * Given two points, return the |distance| between them
  */
  private int getSide(int x1, int x2) {
    
    int side = x1 - x2;
    
    if(side < 0) {
      side = side * -1;
    }
  
    return side;
  }

}
