Planet planet;
Rocket rocket;

void setup() {
  size(640, 640);  
  planet = new Planet(width / 2, height / 2, 30, 10);
  rocket = new Rocket(planet.x, planet.y, planet.radius);
}

void keyPressed() {
  if (keyCode == 32) {
    rocket.launch();
  }
}

void update() {
  rocket.update();
}

void draw() {
  update();
  background(0);
  fill(255);
  stroke(255);
  
  planet.draw();
  rocket.draw();
}
