static final float G = 6.673 * pow(10, -11); // Gravitational constant
static final float EARTH_MASS = 5.98 * pow(10, 24);
static final float DIST = 6.38 * pow(10, 6); // Distance to the center of the Earth

static final float PLANET_RADIUS = 10f;
static final float SCALE = DIST / PLANET_RADIUS;

static class Math {
  
  /**
  * Given the distance to the center of the planet, return the current
  * Gravity force on the object.
  * Distance will be given in pixels, so we have to convert it to the real
  * thing.
  */
  static float getGravityForce(float distance) {
    return G * EARTH_MASS / pow((float)(distance * SCALE), 2f);
  }
  
  /**
  * Returns the distance to the Planet's center.
  */
  static float getDistanceToCenter(Rocket rocket, Planet planet) {
    float adjacent = getSide(rocket.x, planet.x);
    float opposite = getSide(rocket.y, planet.y);
    float hypotenuse = getHypotenuse(adjacent, opposite);
    return hypotenuse;
  }
  
  /**
  * Returns the distance to the Planet's surface:
  */
  static float getDistanceToSurface(Rocket rocket, Planet planet) {
    float hypotenuse = getDistanceToCenter(rocket, planet);
    return hypotenuse - planet.radius / 2f;
  }
  
  /**
  * Given two sides of a square triange, return the hypotenuse
  */
  private static float getHypotenuse(float adjacent, float opposite) {
    return sqrt((pow(adjacent, 2f) + pow(opposite, 2f)));
  }

  /**
  * Given two points, return the |distance| between them
  */
  private static float getSide(float x1, float x2) {
    float side = x1 - x2;
    return side;
  }

}
