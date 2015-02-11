ParticleSystem ps;
Planet[] planets;
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
  
  planets = new Planet[3];
  planets[0] = new Planet(width / 2, height / 2, PLANET_RADIUS, EARTH_MASS);
  planets[1] = new Planet(180f, 420f, PLANET_RADIUS, EARTH_MASS);
  planets[2] = new Planet(680f, 100f, PLANET_RADIUS, EARTH_MASS);
  
  rocket = new Rocket(planets[0].x, planets[0].y - planets[0].radius / 2);
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
    
    for (int i = 0; i < planets.length; i++) {
      trajectory.calculate(planets[i], rocket);
    }
    
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
  
  for (int i = 0; i < planets.length; i++) {
    trajectory.draw(planets[i], rocket);
  }
  
  fill(255);
  stroke(255);
  
  text("Press R to restart", 10, 80);
  text("Left/Right arrows to change angle", 10, 100);
  text("Space to toggle engines", 10, 120);
}

