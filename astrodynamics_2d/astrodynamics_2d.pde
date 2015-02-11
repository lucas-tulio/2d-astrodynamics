ParticleSystem ps;
Planet[] planets;
Rocket rocket;
Space space;
Trajectory trajectory;
boolean rekt;
int numPlanets = 1;

void setup() {
  size(1000, 600);
  frameRate(60);
  ps = new ParticleSystem();
  start();
}

void start() {
  
  planets = new Planet[numPlanets];
  if (numPlanets == 1) {
    planets[0] = new Planet(width / 2, height / 2, PLANET_RADIUS, EARTH_MASS);
    trajectory = new Trajectory(50, 5000);
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

void draw() {
  
  update();
  
  background(0);
  
  if (rekt) {
    fill(255, 0, 0);
    stroke(255, 0, 0);
  } else {
    
    trajectory.calculate(planets, rocket);
    
    fill(255);
    stroke(255);
  }
  
  space.draw();
  for (int i = 0; i < planets.length; i++) {
    planets[i].draw();
  }
  
  if (rekt == false) {
    rocket.draw(width, height, ps);
  }
  
  if (planets.length == 1) {
    trajectory.draw(planets[0], rocket);
  }
  
  fill(255);
  stroke(255);
  
  if (planets.length == 1) {
    text("distance to surface: " + Math.getDistanceToSurface(rocket, planets[0]), 10, 20);
    text("gravity on rocket: " + Math.getGravityForce(Math.getDistanceToCenter(rocket, planets[0])), 10, 40);
  }
  
  text("Press R to restart", 10, 80);
  text("Left/Right arrows to change angle", 10, 100);
  text("Space to toggle engines", 10, 120);
}

