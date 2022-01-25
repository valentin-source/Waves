class Enemy extends Ball {
  
  Enemy(float xPos, float yPos, float xVel, float yVel, float div) {
    super( xPos,  yPos,  xVel, yVel, div);
    this.size = 8;
  }
  
  void update() {
    follow(player1.pos);
    super.update();
  }

  void show() {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, size, size);
    stroke(255,0,0);
    strokeWeight(3);
    point(pos.x,pos.y);
  }
}
