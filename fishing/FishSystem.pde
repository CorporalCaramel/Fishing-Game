class FishSystem {  //System of the fish class

  ArrayList<Fish> plist;  //List of fishes to be used 
  PVector origin;  //origin, which is declared here
  int score; //checking how many fish were caught
  FishSystem(int num, PVector location) {
    origin = location.get();  //setting origin
    plist = new ArrayList<Fish>();
    for (int i = num; i>=0; i--)
    {
      plist.add(new Fish(origin));
    }
  }

  void run() {
    for (int i = plist.size()-1; i >= 0; i--) {  //decreasing order to make sure we don't miss any fishes
      Fish p = plist.get(i);  //declaring p as the current fish for ease of use
      p.run();  //iterate
      if (p.isDead()&&p.getScore()==true) {  //if the fish is dead/offscreen, remove it
        score++;
        plist.remove(i);
      } else if (p.isDead())
        plist.remove(i);
    }
    for (int i = ps.size(); i>=0; i--) {
      if (ps.dead() == true) {
        ps.addFish(new PVector(width, random(water+fishY, height-fishY)));
      }
      timer--;
    }
  }

  void addFish(PVector loc) {  //adding fishes back into the arraylist
    origin = loc.get();
    plist.add(new Fish(origin));
  }
  void addfishes(int size) {  //adding fishes back into the arraylist so it can continually shoot fishes
    for (int i= size; i>=0; i--) {
      plist.add(new Fish(origin));
    }
  }

  int returnScore() {
    return score;
  }

  int size() {
    return plist.size();
  }

  boolean dead() {  //isdead -- used in the future possibly
    if (plist.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

  ArrayList full() {
    return plist;
  }
}
