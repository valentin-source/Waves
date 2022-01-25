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
    return end-start;
  }
  
  long getScoreSeconds(){
    return getScoreMillis()/1000;
  }
  
  String getScoreString(){
    return message + getScoreSeconds() + " seconds";
  }
  
  String getFullScoreString(){
   return message + getScoreMillis() + " milliseconds";
  }
  
  void show(){
    fill(180, 255, 180);
    textSize(30);
    text(getFullScoreString(), 400, 560);
  }

}
