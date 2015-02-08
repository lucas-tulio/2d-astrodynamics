ParticleSystem ps;
Planet planet;
Rocket rocket;
Space space;
Trajectory trajectory;
boolean rekt;

void setup() {
  size(1000, 600);
  trajectory = new Trajectory();
  ps = new ParticleSystem();
  start();
}

void start() {
  
  planet = new Planet(width / 2, height / 2, PLANET_RADIUS, EARTH_MASS);
  rocket = new Rocket(planet.x, planet.y - planet.radius / 2);
  space = new Space(500);
  rocket.y -= 280f;
  rocket.angle += PI/2;
  
  rekt = false;
}

void keyPressed() {
  if (keyCode == 82) {
    start();
  } else if (keyCode == 32) { // Space
    rocket.toggleThurst();
  } else if (keyCode == 37) { // Left
    rocket.rotateLeft();
  } else if (keyCode == 39) { // Right
    rocket.rotateRight();
  }
}

void update() {
  
  if (Math.getDistanceToCenter(rocket, planet) < planet.radius / 2) {
    rekt = true;
  }
  
  if (rekt == false) {
    rocket.update(planet);
  }
  
  
}

void draw() {
  
  update();
  
  background(0);
  
  if (rekt) {
    fill(255, 0, 0);
    stroke(255, 0, 0);
  } else {
    trajectory.calculate(planet, rocket);
    fill(255);
    stroke(255);
  }
  
  space.draw();
  planet.draw();
  if (rekt == false) {
    rocket.draw(width, height, ps);
  }
  
  trajectory.draw(planet, rocket);
  
  fill(255);
  stroke(255);
  text("distance to surface: " + Math.getDistanceToSurface(rocket, planet), 10, 20);
  text("gravity on rocket: " + Math.getGravityForce(Math.getDistanceToCenter(rocket, planet)), 10, 40);
  
  text("Press R to restart", 10, 80);
  text("Left/Right arrows to change angle", 10, 100);
  text("Space to toggle engines", 10, 120);
}

