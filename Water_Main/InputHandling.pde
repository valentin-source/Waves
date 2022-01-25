
/*void mouseDragged() {
  bg.previous[mouseX][mouseY] = intensity;
}
void mousePressed() {
  //ball.following = !ball.following;
  bg.previous[mouseX][mouseY] = intensity;
}
*/


void keyPressed() {
  if (key == CODED) {
    //if (keyCode == UP) intensity += 500;
    //if (keyCode == DOWN) intensity -= 500;
  } else {
    if (key == 'w') keys[0] = true;
    if (key == 'a') keys[1] = true;
    if (key == 's') keys[2] = true;
    if (key == 'd') keys[3] = true;
    if (key == ' ') keys[4] = true;
  }

  if (!gameStillRunning) {
    if (key == 'r' || key == 'R') {
      gameStillRunning = true;
      gameSetup();
    }
  }
}

void keyReleased() {
  if (key == 'w') keys[0] = false;
  if (key == 'a') keys[1] = false;
  if (key == 's') keys[2] = false;
  if (key == 'd') keys[3] = false;
  if (key == ' ') keys[4] = false;
}
