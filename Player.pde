/*
Movment^
roation^
collison
*/
class Player{
final PVector v;
final PVector center;
//final float roation;
float xr;

Player(PVector c,PVector v_) {
    center = c;
    //roation=r;
    v= v_;  
}
  
  Player(){
  center= new PVector(random(width), random(height));
  v= new PVector(1,1);
}

//moves center based on alceration 
void Move(){
float i=0;
float t, last_t, dt;
t = 1;
float vx=v.x;
float vy=v.y;
float a;
float ay;
float f=0;
 // dt = last_t - t;
  //last_t = t;
a=pow(vx,2)/t;
center.x=center.x+a;

ay=pow(vy,2)/t;
center.y=center.y+ay;

//does not work
if(keyPressed){
  if(key == 'd'||key =='D'){
    while(i<10){
      vx=pow(vx,2)/t;
      center.x=center.x+vx;
      t++;
      i++;
    }
    
  }
}
//does not work
if(keyPressed){
  if(key == 'a'|| key == 'A'){
    while(i<10){
      vx=pow(vx,2)/t;
      center.x=center.x-vx;
      t++;
      i++;
    }
  }
}
if(keyPressed){
  if(key == 'w'|| key=='W'){
    while(i<10){
      vx=pow(vy,2)/t;
      center.y=center.y+vy;
      t++;
      i++;
    }
  }
}
if(keyPressed){
  if(key == 's'|| key=='S'){
    while(i<10){
        vx=pow(vy,2)/t;
        center.y=center.y-vy;
        t++;
        i++;
    }
  } 
}
if (center.x>width){



}
}
//*Does not work* gets roation of player to give to breaker class
float roation(){
if(keyPressed){
if(key == 'q'|| key== 'Q'){
xr=xr+1;
}
}
if(keyPressed){
if(key == 'e'|| key== 'E'){
xr=xr-1;

}

}
return xr;

}

//makes player based off center
private void makeplayer(float x, float y, int radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

// draws player  
void renderplayer(){
pushMatrix();
  translate(center.x,center.y);
  rotate(roation());
  makeplayer(0,0,60,3); 
 
  popMatrix();
}
}