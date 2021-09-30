class Bubbles {
 float x, y, r;
 color col;


 
 Bubbles() {
   x = random(width);
   y = random(height);
   r = random(width/5);
 
 }
   
 Bubbles(float tempX, float tempY, float tempR){
 x = tempX;
 y = tempY;
 r = tempR;
 col = 0;
}

void overlaps(Bubbles other){
  float d = dist(x, y, position.x, position.y);
  if (d < r + other.r) {
    col = color(random(255), random(255), random(255));
  } else {


}

}
void display() {
fill(col, 100);
ellipse(x, y, r*2, r*2);

}
}
