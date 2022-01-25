class EnemyWithConstantSpeed extends Enemy{

   EnemyWithConstantSpeed(float xPos, float yPos, float xVel, float yVel, float div) {
    super( xPos,  yPos,  xVel, yVel, div);
    this.size = 8;
  }
  
  void update() {
    follow(player1.pos);
    super.update();
  }
  
  void follow(PVector p){
    PVector tmp = new PVector(p.x, p.y);
    this.vel = tmp.sub(this.pos).setMag(this.acc);
  }

  void show() {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, size, size);
    stroke(255,255,0);
    strokeWeight(3);
    point(pos.x,pos.y);
  }

}
