class Fish {
  int x, y, w, h;
  float lifespan;
  PVector location, velocity;
  boolean dead, score;
  int lure = 20;
  Fish (PVector l) {
    w=8;
    h=16;
    location = l.get();
    velocity = new PVector(-9, 0);
    lifespan = abs(1000/velocity.x); //setting how long object will live
  }
  void display() {
    if (isDead()==false) {
      image(fish, location.x, location.y);
      //rect(location.x, location.y+15, w, h);      to check hitbox
    }
  }
  void update() {

    if (400+lure/2 > location.x && 400-lure/2 < location.x + w && getRod() + lure/2 > location.y && getRod() - lure/2 < location.y + h) {  //creating hitbox for fish
      score=true;  //scoring if we catch fish
      dead=true;  //set up for removal of fish
      lifespan=0;
    } else if (isDead()==true) {  //going off-screen without being caught
      lifespan=0;
      dead=true;
    } else
      location.add(velocity);
    lifespan-=1;
  }
  void run() {  //for ease of use
    update();
    display();
  }
  boolean isDead() {  //checking if the lifespan of the particle is over yet
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  boolean getScore() {
    return score;
  }
}
