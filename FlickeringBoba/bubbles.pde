class Bubbles {
 float x, y, r;
 color col;
 float bubbleSize;



 
 Bubbles() {
   x = random(width);
   y = random(height);
  bubbleSize = random(width/3);
   r = random(bubbleSize);  //randomized placements and shapes of the bubbles
 
 }
   
 Bubbles(float tempX, float tempY, float tempR){
 x = tempX;
 y = tempY;
 r = tempR;
 col = 0; //the colours of the bubbles are automatically set to value 0, but this can be called upon later to be changed when the overlaps function is used
}

void overlaps(Bubbles other){
  float d = dist(x, y, position.x, position.y); //when the distance between coordinates of a bubble and the face close in on eachother, the overlaps function activates
  if (d < r + other.r) {
    col = color(random(255), random(255), random(255));
    bubbleSize --;  //when the creature interacts with a bubble, it will shrink it until.  Once the bubble is completely shrunk, further interaction will inflate the bubble
  } else {

 

}

}
void display() {
fill(col, 100);
ellipse(x, y, bubbleSize, bubbleSize);

}
}
