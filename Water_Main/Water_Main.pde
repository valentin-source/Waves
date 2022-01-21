Player player1;
Background_Simulation bg;
boolean gameStillRunning = true;

ArrayList<Enemy> arr = new ArrayList<>();



int intensity = 500;
int speed = 10;
float Wavedampening = 0.992;
public boolean[] keys;

void gameSetup() {
  bg = new Background_Simulation();
  player1 = new Player(width/2, height/2, 0, 0, 10);
  keys=new boolean[5];
  for (int i = 0; i<keys.length; i++) {
    keys[i] = false;
  }
  arr.clear();
  for (int i = 0; i < 5; i++) {
    arr.add(new Enemy(random(width), random(height), 0, 0, random(0.05, .15)));
  }
}

void setup() {
  size(1000, 800);
  ellipseMode(CENTER);
  textMode(CENTER);
  gameSetup();
}

void draw() {

  if (gameStillRunning) {

    bg.show();

    player1.update();
    player1.show();
    for (Enemy e : arr) {
      e.update();
      e.show();
    }

    if (player1.collide(arr)) {
      gameStillRunning = false;
    }
  } else {
    fill(255,0,0);
    textSize(100);
    text("Game Over", width/2-200, height/2);
    fill(180,255,180);
    textSize(50);
    text("press R to continue", 400, 480);
    textSize(30);
    text("Accelerate with w,a,s,d", 400, 520);
  }
}