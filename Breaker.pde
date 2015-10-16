class Breaker {
  final PVector center;
  final PVector v;
  Breaker(PVector c,PVector v_) {
    center = c;
    v= v_;  
}

  // Create a Breaker with a random position, uniformly distributed
  // over the area of the window.
  Breaker(float x_,float y_,float r_) {
    center = new PVector(x_,y_);//based off player movement
    v= new PVector(-100,0);  
    v.rotate(r_);// based off of player roataion 
}
  
  float radius() {
    return 5;
  }
  
  void render() {
    fill(255);
    stroke(0);
    ellipse(center.x, center.y, 5, 5);
  }

public void update(float dt) {
    PVector dv = v.copy();
    dv.mult(dt/1000);
    center.add(dv);
    center.x = (width + center.x) % width;
    center.y = (height + center.y) % height;
  }



}
