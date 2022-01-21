class Player extends Ball {

  boolean following = false;

  Player(float xPos, float yPos, float xVel, float yVel, float div) {
    super(xPos, yPos, xVel, yVel, div);
    this.maxSpeed = 1600;
  }

  void steeringByPlayer() {
    if (keys[0]) vel.add(new PVector(0, -acc));
    if (keys[1]) vel.add(new PVector(-acc, 0));
    if (keys[2]) vel.add(new PVector(0, acc));
    if (keys[3]) vel.add(new PVector(acc, 0));
    if (keys[4]) if (pos.y >= height-5) vel.y = -250;
  }

  void show() {
    strokeWeight(0);
    fill(25,255,50);
    ellipse(this.pos.x, this.pos.y, 10, 10);
  }



  void update() {
    //if (following) follow(mouseX, mouseY);
    steeringByPlayer();
    checkAverageVel();
    super.update();
  }
}
