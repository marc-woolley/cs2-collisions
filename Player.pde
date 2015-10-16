/*
Movment^
roation^
collison
*/
class Player{
final PVector v;
final PVector center;//x and y points in the center of the shape where to draw from
//final float roation;
float xr;//
//constuctor  
Player(PVector c,PVector v_) {
    center = c;
    //roation=r;
    v= v_;  
}
//Defines the player center and starting vocelicty  
  Player(){
  center= new PVector(random(width), random(height));
  v= new PVector(1,1);
}

//moves center based on the player's current alceration 
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
//this was meant to make alceration a constant but due to lack of of time it was not completed 
//the bug being that vx had to have a value greater then 0 but if it had that it made it move in the wrong deriction 
//a=pow(vx,2)/t;
//center.x=center.x+a;

//ay=pow(vy,2)/t;
//center.y=center.y+ay;

//does not work as intened does not continue caluation outside of these conitions 
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
//does not work as intened does not continue caluation outside of these conitions 
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
//does not work as intened does not continue caluation outside of these conitions 
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
//does not work as intened does not continue caluation outside of these conitions 
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
// was going to stop the ship from moving too far off screen by making come out the side oppsite of that it exited the screen 
if (center.x>width){



}
}
//  roatates the player and breakers 
float roation(){
if(keyPressed){
if(key == 'q'|| key== 'Q'){
xr=xr+.01;
}
}
if(keyPressed){
if(key == 'e'|| key== 'E'){
xr=xr-.01;

}

}
return xr;

}

//makes player based off center defined in the construtorer 
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

// draws player in the draw function  
void renderplayer(){
pushMatrix();
  translate(center.x,center.y);
  rotate(roation());
  makeplayer(0,0,40,3); 
 
  popMatrix();
}
}