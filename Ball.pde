// By Adam Reis, based on code by Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-2: Bouncing ball class

class Ball {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width-2*r)+r;
    y = random(height-2*r)+r;
    xspeed = random( - 6,6);
    yspeed = random( - 6,6);
  }
  
  void moveL() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    //r += ((int)random(3)-1);
    // Check horizontal edges
    if (x > width-r || x < r) {
      out.playNote(0, 0.5, 4*r);
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-r || y < r) {
      out.playNote(0, 0.5, 4*r);
      yspeed *= - 1;
    }
  }
  
  void moveQ() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    //r += ((int)random(3)-1);
    // Check horizontal edges
    if (x > width-r || x < r) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-r || y < r) {
      yspeed *= - 1;
    }
  }
  
  // Draw the ball
  void display() {
    stroke(0);
    fill(0,50);
    ellipse(x,y,r*2,r*2);
  }
}
