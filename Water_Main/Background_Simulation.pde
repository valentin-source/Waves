class Background_Simulation {

  int cols;
  int rows;
  float[][] current;
  float[][] previous;

  Background_Simulation() {
    frameRate(60);
    cols = width;
    rows = height;
    current = new float[cols][rows];
    previous = new float[cols][rows];
  }

  void show() {
    background(0);
    loadPixels();

    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        current[i][j] = (

          previous[i-1][j] +
          previous[i+1][j] +
          previous[i][j-1] +
          previous[i][j+1]) / 2 -
          current[i][j];
        current[i][j] = current[i][j] * Wavedampening;
        if(current [i][j] > 500) current [i][j] = 500;
        if(current [i][j] < -500) current [i][j] = -500;
        int index = i + j * cols;
          //pixels[index] = color(current[i][j]);
          //pixels[index] = color(map(current[i][j],-500,500, 0,255));
          pixels[index] = color(map(current[i][j],-500,500, 0,255));
         
      }
    }
    
    fill(150,150,0);
    stroke(0);
    strokeWeight(2);
    ellipse(width/2, height/2, 35, 35);

    float[][] temp = previous;
    previous = current;
    current = temp;
    updatePixels();
  }
}
