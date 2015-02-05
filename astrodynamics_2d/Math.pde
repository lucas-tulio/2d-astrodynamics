class Math {
  
  /**
  * Returns the distance to the Planet's surface
  */
  public static double distanceToSurface(Rocket rocket, Planet planet) {
    
  }
  
  /**
  * Given two sides of a square triange, return the hypotenuse
  */
  double getHypotenuse(adjacent, opposite) {
    return Math.sqrt((double)(Math.pow(adjacent, 2) + Math.pow(opposite, 2)));
  }

  /**
  * Given two points, return the |distance| between them
  */
  int getSide(int x1, int x2) {
    
    int side = x1 - x2;
    
    if(side < 0) {
      side = side * -1;
    }
  
    return side;
  }

}
