int xAlign=100, yAlign=50, xLoc=800, yLoc=400, fishX=100, fishY=40, timer=60;
float opacity, lure=20, rodY, rodMax=50, water=150;
boolean op, click;
PImage fish;
int x, y, w=8, h=16;
float step=8;
FishSystem ps;
void setup() {
  background(255);
  size(800, 600);
  fish = loadImage("dogfish.gif");
  fish.resize(fishX, fishY);
  ps = new FishSystem(1, new PVector(width, random(water+fishY, height-fishY)));
  timer*=frameRate;
}
void draw() {
  if (!click)  //wait for any button press  
  {
    menu();
  } else if (timer>0) {  //else run the game until timer is up
    bg();
    ps.run();
  } else {  //end screen
    endMenu();
  }
}

void keyPressed() {  //for menu
  if (click==false) {
    click=true;
  }
}
void mouseClicked() {  //also to open game
  if (click==false) {
    click=true;
  }
}
void mouseDragged() {  //moving rod within the game
  if (click==true && mouseButton==LEFT) {
    rodStep();
  }
}
void rodStep() {  //to move the rod around
  if (mouseY>=rodMax) {
    rodY=mouseY-lure;
  } else
    rodY=rodMax;
}

void bg() {    //drawing water and fishing hole, as well as the rod
  background(255);
  {
    fill(#0099CB);
    noStroke();
    rectMode(CORNERS);
    rect(0, water+30, width, height);
    stroke(1);
    rectMode(CORNER);
    fill(255);
  }
  rect(0, water, 300, 30);
  rect(500, water, 300, 30);
  strokeWeight(8);
  line(400, rodMax, 600, water);
  strokeWeight(1);
  fill(255, 0, 0);
  triangle(550, water, 560, water-20, 570, water);
  fill(255);
  line(400, rodMax, 400, rodY);
  rectMode(CENTER);
  rect(400, rodY, lure, lure);
  rectMode(CORNER);
  fill(0);
  text("Time Left: " + int(timer/frameRate), width-70, 50);
  text("Score: " + ps.returnScore(), 50, 50);
}
void menu() {
  background(255);
  fill(0);
  textSize(40);
  text("WELCOME TO FAST FISHING", width/2, 50 );
  fill(opacity);  //changing opacity of text
  opacity();
  text("Press any key to continue...", width/2, height-yAlign);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("The goal of fishing is to catch as many fish as possible", width/2, 100);  //Game Explanation
  text("First hold down a key to move your rod", width/2, 100+yAlign);
  text("Then move the rod to catch the fishes by their mouth", width/2, 100+2*yAlign);
  text("Wait 60 seconds, and try to get a highscore!", width/2, 100+3*yAlign);
  fill(255);
}
void opacity() {  //to make sure user knows where to go
  if (op==true) {  //setting the opacity to up or down
    opacity+=3;
  } else {
    opacity-=3;
  }
  if (opacity>=255) {  //hitting upper and lower bounds of greyscale
    op=false;
  } else if (opacity<=0)
    op=true;
}
void endMenu() {  //menu to show score at the end of the game
  fill(0);
  background(255);
  text("Game Over", width/2, height/2);
  text("You got " + ps.returnScore() + " fish", width/2, height/2+yAlign);
}
float getRod() {
  return rodY;
}
