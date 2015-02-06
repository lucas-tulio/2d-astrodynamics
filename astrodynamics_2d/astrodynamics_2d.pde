ParticleSystem ps;
Planet planet;
Rocket rocket;
boolean rekt;

void setup() {
  size(640, 640);
  ps = new ParticleSystem();
  start();
}

void start() {
  planet = new Planet(width / 2, height / 2, 10, 10);
  rocket = new Rocket(planet.x, planet.y - planet.radius / 2);
  rocket.y -= 80f;
  
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
    fill(255);
    stroke(255);
  }
  
  planet.draw();
  if (rekt == false) {
    rocket.draw(width, height, ps);
  }
  
  fill(255);
  stroke(255);
  text("distance to surface: " + Math.getDistanceToSurface(rocket, planet), 10, 20);
  text("gravity on rocket: " + Math.getGravityForce(Math.getDistanceToCenter(rocket, planet)), 10, 40);
}

