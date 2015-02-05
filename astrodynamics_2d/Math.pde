static class Math {
  
  /**
  * Returns the distance to the Planet's surface:
  *
  * 1. Get the sides of the right triangle formed between the Rocket
  *    and the Planet.
  * 2. Calculate the hypotenuse
  * 3. Subtract the Planet's radius from this value
  */
  static double distanceToSurface(Rocket rocket, Planet planet) {
    int adjacent = getSide(rocket.x, planet.x);
    int opposite = getSide(rocket.y, planet.y);
    double hypotenuse = getHypotenuse(adjacent, opposite);
    return hypotenuse - planet.radius / 2;
  }
  
  /**
  * Given two sides of a square triange, return the hypotenuse
  */
  private static double getHypotenuse(int adjacent, int opposite) {
    return sqrt((pow(adjacent, 2) + pow(opposite, 2)));
  }

  /**
  * Given two points, return the |distance| between them
  */
  private static int getSide(int x1, int x2) {
    
    int side = x1 - x2;
    
    if(side < 0) {
      side = side * -1;
    }
  
    return side;
  }

}
