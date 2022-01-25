class Wall {

  PVector pos;
  PVector size;

  Wall(int x1, int y1, int width_, int height_) {
    this.pos = new PVector(x1, y1);
    this.size = new PVector(width_, height_);
  }

  PVector[] getCorners() {
    PVector[] a = new PVector[4];
    a[0] = new PVector(pos.x-size.x/2, pos.y-size.y/2);
    a[1] = new PVector(pos.x+size.x/2, pos.y-size.y/2);
    a[2] = new PVector(pos.x-size.x/2, pos.y+size.y/2);
    a[3] = new PVector(pos.x+size.x/2, pos.y+size.y/2);
    return a;
  }



  void show() {
    rectMode(CENTER);
    
    for (int i = (int)(pos.x-size.x/2); i<(int)(pos.x+size.x/2); i++) { //width
      for (int j = (int)(pos.y-size.y/2); j<(int)(pos.y+size.y/2); j++) { //height
        bg.previous[i][j] = 0;
        pixels[i+j*bg.cols] = color(0);
      }
    }
    updatePixels();

    //rect(pos1.x, pos1.y, pos2.x, pos2.y);
  }
}
