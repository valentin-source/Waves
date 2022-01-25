class Scoreboard{
  
  String message = "Score: ";
  long start;
  long end;
  
  Scoreboard(){
    this.start = System.currentTimeMillis();
  }
  
  void end(){
    this.end = System.currentTimeMillis();
  }
  
  long getScoreMillis(){
    return this.end-this.start;
  }
  
  long getScoreSeconds(){
    return this.getScoreMillis()/1000;
  }
  
  String getScoreString(){
    return this.message + this.getScoreSeconds() + " seconds";
  }
  
  String getFullScoreString(){
   return this.message + this.getScoreMillis() + " milliseconds";
  }
  
  void show(){
    fill(180, 255, 180);
    textSize(30);
    text(getScoreString(), 400, 560);
  }

}
