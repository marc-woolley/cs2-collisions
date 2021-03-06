class Asteroid {
     final int size;  // number of sides
     PVector center;  // position of center, in screen coordinates
     final PVector v;  // velocity, per second, in screen coordinates

  Asteroid(int s, PVector c, PVector v_) {
    size = s;
    center = c;
    v = v_;
  }
  
  // Create a new Asteroid with a random position & velocity.  The
  // position is uniformly distributed over the window area.  The
  // velocity is in a random direction, always with magnitude 100
  // pixels/second.
  Asteroid() {
    size = 8;
    center = new PVector(random(width), random(height));
    v = new PVector(100,0);
    v.rotate(random(TWO_PI));
  } 

  // Update the position of the Asteroid according to its velocity.
  // The argument dt is the elapsed time in milliseconds since the
  // last update.  Modifies the Asteroid.
  public void update(float dt) {
    PVector dv = v.copy();
    dv.mult(dt/1000);
    center.add(dv);
    center.x = (width + center.x) % width;
    center.y = (height + center.y) % height;
  }

  // Draw a polygon with the current style.  `polygon(x, y, r, n)`
  // draws a n-sided polygon with its circumcenter at (x,y), with a
  // distance r from the center to each vertex.
  private void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
int childShape(){
int smallsize;
smallsize= this.size-1;
return smallsize;
}
boolean canSplit(int size){
boolean canisplit;
  if(size<4){
canisplit=false;
}else{
canisplit=true;
}
  return canisplit;
}
float radius(){
float radius=0;
if(size==4){
radius=10;
}else if(size==5){
radius=12.7;
}else if(size==6){
radius=16;
}else if(size==7){
radius=20.2;
}else if(size==8){
radius=25.4;
}
return radius;
}

void render(){
polygon(center.x,center.y,this.radius(),size);

}

Pair<PVector,PVector> childVelocities(){
PVector av;
PVector av2;
float rad= radians(30);
float rad2= radians(-30);
av=PVector.mult(this.v,1.1);
av2=av.copy();
PVector arp= av.rotate(rad);
PVector arn= av2.rotate(rad2);
Pair ret= new Pair(arp,arn);
return ret;

}

Pair children(){
  
Asteroid a= new Asteroid(childShape(),center,childVelocities().a);
Asteroid b= new Asteroid(childShape(),center.copy(),childVelocities().b);  
Pair ret=new Pair(a,b);
return ret;
}


}