ParticleSystem ps;
Planet[] planets;
Rocket rocket;
Space space;
Trajectory trajectory;
boolean rekt;
int numPlanets = 1;
boolean showText;

boolean leftKey, rightKey, upKey;

void setup() {
  size(1000, 600);
  frameRate(60);
  noSmooth();
  ps = new ParticleSystem();
  start();
}

void start() {
  
  planets = new Planet[numPlanets];
  if (numPlanets == 1) {
    planets[0] = new Planet(width / 2, height / 2, PLANET_RADIUS, EARTH_MASS);
    trajectory = new Trajectory(50, 2000);
  } else {
    for (int i = 0; i < planets.length; i++) {
      planets[i] = new Planet(random(width), random(height), PLANET_RADIUS, EARTH_MASS);
    }
    trajectory = new Trajectory(10, 1000);
  }
  
  rocket = new Rocket(360f, 50f);
  rocket.angle += PI/2;
  
  space = new Space(500);
  
  rekt = false;
  showText = true;
}

void keyPressed() {
  if (keyCode == 72) {
    showText = !showText;
  }
  if (keyCode == 82) {
    start();
  }
  if (keyCode == 38 || keyCode == 32) {
    upKey = true;
  }
  if (keyCode == 37) {
    leftKey = true;
  }
  if (keyCode == 39) {
    rightKey = true;
  }
}

void keyReleased() {
  if (keyCode == 38|| keyCode == 32) {
    upKey = false;
  }
  if (keyCode == 37) {
    leftKey = false;
  }
  if (keyCode == 39) {
    rightKey = false;
  }
}

void handleInput() {

  rocket.enginesOn = upKey;

  if (leftKey) { // Left
    rocket.rotateLeft();
  } else if (rightKey) { // Right
    rocket.rotateRight();
  }
}

void update() {
  
  handleInput();

  for (int i = 0; i < planets.length; i++) {
    if (Math.getDistanceToCenter(rocket, planets[i]) < planets[i].radius / 2) {
      rekt = true;
    }
  }
  
  if (rekt == false) {
    for (int i = 0; i < planets.length; i++) {
      rocket.update(planets[i]);
    }
  }
}

void mouseClicked() {
  upKey = !upKey;
}

void mouseMoved() {
  // Mouse look
  rocket.angle = -atan2((mouseX - rocket.x), ((mouseY - rocket.y) * PI));
}

void draw() {
  
  update();
  
  background(0);

  // Draw trajectory  
  if (rekt == false) {

    trajectory.calculateAndDraw(planets, rocket);
    
    if (planets.length == 1) {
      trajectory.draw(planets[0], rocket);
    }
  }
  
  // Draw space and Planets
  space.draw();
  for (int i = 0; i < planets.length; i++) {
    planets[i].draw();
  }
  
  // Draw the rocket
  if (rekt == false) {
    rocket.draw(width, height, ps);
  }

  // Draw UI text
  fill(255);
  stroke(255);
  
  if (showText) {
    if (planets.length == 1) {
      text("distance to surface: " + Math.getDistanceToSurface(rocket, planets[0]), 10, 20);
      text("gravity on rocket: " + Math.getGravityForce(Math.getDistanceToCenter(rocket, planets[0])), 10, 40);
    }
    text("Press R to restart", 10, 80);
    text("Left/Right arrows to change angle", 10, 100);
    text("Up or space to thrust", 10, 120);
    text("H to hide this text", 10, 140);
  }
}

