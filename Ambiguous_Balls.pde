// By Adam Reis, based on code by Daniel Shiffman
// http://www.learningprocessing.com

Ball ball1;
Ball ball2;
Ball ball3;
int count;
int count12;
int count23;
int count13;
int mode;
import ddf.minim.*;

Minim minim;
AudioOutput out;

void setup() {
  mode = 0;
  minim = new Minim(this);
  out = minim.getLineOut( Minim.MONO, 2048 );
  size(600, 600);
  smooth();

  // Initialize balls
  ball1 = new Ball(84);
  ball2 = new Ball(52);
  ball3 = new Ball(random(30, 100));
  count = count12 = count23 = count13 = 70;
}

void draw() {
  background(255);
  if (mode == 0) {
    // Move and display balls
    ball1.moveL();
    ball2.moveL();
    ball3.moveL();
    intersect(ball1, ball2, ball3);
    ball1.display();
    ball2.display();
    ball3.display();
  }

  if (mode == 1) {
    // Move and display balls
    ball1.moveQ();
    ball2.moveQ();
    ball3.moveQ();
    intersect(ball1, ball2, "12");
    intersect(ball3, ball2, "23");
    intersect(ball1, ball3, "13");
    intersect(ball1, ball2, ball3);
    ball1.display();
    ball2.display();
    ball3.display();
  }

  if (mode == 2) {
    // Move and display balls
    if (random(100)>98) {
      out.playNote(random(2), 0.5, random(500)+200);
    }
    ball1.moveQ();
    ball2.moveQ();
    ball3.moveQ();
    intersect(ball1, ball2, ball3);
    ball1.display();
    ball2.display();
    ball3.display();
  }
}

void intersect(Ball b1, Ball b2, String C) {
  if (C=="12") {
    if (count12>=70) {
      if (dist(b1.x, b1.y, b2.x, b2.y)<(b1.r+b2.r)) {
        out.playNote(0, 0.5, 1.5*(b1.r+b2.r));
        count12 = 0;
      }
    }
    count12++;
    //println(count);
  }
  else if (C=="23") {
    if (count23>=70) {
      if (dist(b1.x, b1.y, b2.x, b2.y)<(b1.r+b2.r)) {
        out.playNote(0, 0.5, 1.5*(b1.r+b2.r));
        count23 = 0;
      }
    }
    count23++;
    //println(count);
  }

  else if (C=="13") {
    if (count13>=70) {
      if (dist(b1.x, b1.y, b2.x, b2.y)<(b1.r+b2.r)) {
        out.playNote(0, 0.5, 1.5*(b1.r+b2.r));
        count13 = 0;
      }
    }
    count13++;
    //println(count);
  }
}

void intersect(Ball b1, Ball b2, Ball b3) {

  if (count>=70) {
    if (dist(b1.x, b1.y, b2.x, b2.y)<(b1.r+b2.r) && dist(b1.x, b1.y, b3.x, b3.y)<(b1.r+b3.r) && dist(b3.x, b3.y, b2.x, b2.y)<(b2.r+b3.r)) {
      //print("kaplow! ");
      int tempMode = mode;
      //while (mode == tempMode)
        mode = (int)random(3);
      //println("mode: "+mode);
      count = 0;
    }
  }
  count++;
  //println(count);
}

