Planet planet;
Rocket rocket; 

void setup() {
  size(640, 640);  
  start();
}

void start() {
  planet = new Planet(width / 2, height / 2, 30, 10);
  rocket = new Rocket(planet.x, planet.y - planet.radius / 2);
  
  rocket.y -= 80;
}

void keyPressed() {
  if (keyCode == 82) {
    start();
  } else if (keyCode == 32) {
    rocket.thurst.x = 0f;
  }
}

void update() {
  rocket.update(planet);
}

void draw() {
  update();
  background(0);
  fill(255);
  stroke(255);
  
  planet.draw();
  rocket.draw();
  
  text("distance to surface: " + Math.getDistanceToSurface(rocket, planet), 10, 20);
  text("gravity on rocket: " + Math.getGravityForce(Math.getDistanceToCenter(rocket, planet)), 10, 40);
}
