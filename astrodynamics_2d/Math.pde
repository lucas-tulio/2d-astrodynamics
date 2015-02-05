static final double G = 6.673 * pow(10, -11); // Gravitational constant
static final double EARTH_MASS = 5.98 * pow(10, 24);
static final double DIST = 6.38 * pow(10, 6); // Distance to the center of the Earth
static final double SCALE = 425333; // One pixel equals 425.333 meters

static class Math {
  
  /**
  * Given the distance to the center of the planet, return the current
  * Gravity force on the object.
  * Distance will be given in pixels, so we have to convert it to the real
  * thing.
  */
  static double getGravityForce(double distance) {
    return G * EARTH_MASS / pow((float)(distance * SCALE), 2f);
  }
  
  /**
  * Returns the distance to the Planet's center.
  */
  static double getDistanceToCenter(Rocket rocket, Planet planet) {
    int adjacent = getSide(rocket.x, planet.x);
    int opposite = getSide(rocket.y, planet.y);
    double hypotenuse = getHypotenuse(adjacent, opposite);
    return hypotenuse;
  }
  
  /**
  * Returns the distance to the Planet's surface:
  */
  static double getDistanceToSurface(Rocket rocket, Planet planet) {
    double hypotenuse = getDistanceToCenter(rocket, planet);
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
