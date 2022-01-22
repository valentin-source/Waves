class Ball {

  PVector pos;
  PVector vel;
  int maxSpeed = 1400;
  float acc = 0; //steering force
  float gravity = 10;
  float size = 10;

  float dampening = .998;
  boolean active = true;
  float[] queue = new float[10];

  void updateQueue(float n) {
    for (int i = 1; i< queue.length; i++) {
      queue[i-1] = queue[i];
    }
    queue[queue.length-1] = n;
  }

  Ball(float xPos, float yPos, float xVel, float yVel, float div) {
    this.pos = new PVector(xPos, yPos);
    this.vel = new PVector(xVel, yVel);
    this.acc = div;
  }
  
  boolean collide(ArrayList<Enemy> arr){
    for(Ball b : arr){
      if(dist(this.pos.x, this.pos.y, b.pos.x, b.pos.y) <= this.size/2+b.size/2) return true;
    }
    return false;
  }

  void bounce(float df) {

    if (this.pos.x < 1 ) {
      this.pos.x = 1;
      this.vel.x *= -df;
      //interact();
    }
    if (this.pos.x > width-1) {
      this.pos.x = width-1;
      this.vel.x *= -df;
      //interact();
    }
    if (this.pos.y < 1 ) {
      this.pos.y = 1;
      this.vel.y *= -df;
      //interact();
    }
    if (this.pos.y > height-1) {
      this.pos.y = height-1;
      this.vel.y *= -df;
      //interact();
    }
  }

  void update() {
    this.move();
    this.bounce(0.92);
    this.dampen();
    this.gravity(0,7);
    this.interact();
    this.updateQueue(Math.abs(vel.x) + Math.abs(vel.y));
  }

  void move() {
    this.vel.limit(maxSpeed);
    this.pos.x += this.vel.x/200;
    this.pos.y += this.vel.y/200;
  }

  void dampen() {
    this.vel = this.vel.mult(this.dampening);
  }

  float checkAverageVel() {
    float sum = 0;
    for (float f : queue) {
      sum += f;
    }
    return sum/queue.length;
  }

  void show() {
    strokeWeight(0);
    fill(200, 200, 50);
    ellipse(this.pos.x, this.pos.y, size, size);
  }

  void interact() {
    bg.previous[(int)this.pos.x][(int)this.pos.y] =  sqrt(this.vel.x*this.vel.x + this.vel.y*this.vel.y);
  }

  void follow(int a, int b) {
    PVector tmp = new PVector(a-this.pos.x, b-this.pos.y);
    this.vel.add(tmp.mult(acc));
    stroke(50,80,255);
    strokeWeight(2);
    //line(pos.x, pos.y, a, b);
  }

  void follow(PVector other) {
    PVector tmp = new PVector(other.x, other.y);
    this.vel.add(tmp.sub(this.pos).normalize().mult(acc));
    stroke(50,80,255);
    strokeWeight(2);
    //line(pos.x, pos.y, other.x, other.y);
  }

  void gravity(float x, float y) {
    //follow(width/2, height/2, true); //for planet like gravity
    this.vel.y += y;
    this.vel.x += x;
    //this.vel.y += this.gravity;
  }
}
