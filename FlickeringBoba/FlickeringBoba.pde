/*
* Project: Flickering Boba
* Flicking Boba is virtual creature program that has objects interact with eachother and change colour upon collision
* Source used to understand object interaction and colour change: https://www.youtube.com/watch?v=hNR6fsksEu8&ab_channel=TheCodingTrain  and  https://www.youtube.com/watch?v=50Rzvxvi8D0&ab_channel=TheCodingTrain
*/

Bubbles b1, b2, b3, b4, b5, b6;
PVector position, target;
PImage faceCurrent, faceChase, faceAnger, faceSleep, faceDrowsy;
PImage tank;
float margin = 50;

boolean isBothered = false;
int botheredMarkTime = 0;
int botheredTimeout = 4000; //processing measures time in milliseconds
float botheredSpread = 5;


boolean isBlinking = false;
int blinkMarkTime = 0;
int blinkTimeout = 5000;
int blinkDuration = 300;

float triggerDistance1 = 100;
float triggerDistance2 = 5;
float movementSpeed = 0.08;

void setup() {
  size(600, 400, P2D);
  tank = loadImage("tank.png");
  imageMode(CENTER);
  position = new PVector(width/2, height/2);
 pickTarget();
 
 faceChase = loadImage("faceChase.png");
 faceAnger = loadImage("faceAnger.png");
 faceSleep = loadImage("faceSleep.png");
 faceDrowsy = loadImage("faceDrowsy.png");
 
 faceCurrent = faceAnger;
 
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  
  b1 = new Bubbles();
  b2 = new Bubbles();
  b3 = new Bubbles();
  b4 = new Bubbles();
  b5 = new Bubbles();
  b6 = new Bubbles();

  
}
void draw() {
  background(tank);
 
b1.overlaps(b2);
b3.overlaps(b1);
b2.overlaps(b3);
b4.overlaps(b5);
b6.overlaps(b4);
b5.overlaps(b6);


 
 b1.display();
 b2.display();
 b3.display();
 b4.display();
 b5.display();
 b6.display();


 
  PVector mousePos = new PVector(mouseX, mouseY);
  isBothered = position.dist(mousePos) < triggerDistance1;
  
if (isBothered) {
  botheredMarkTime = millis();
  faceCurrent = faceChase;
  
    position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    if (position.dist(target) < triggerDistance2) {
      pickTarget();
    }
}
else if (!isBothered && millis() > blinkMarkTime + blinkTimeout){
   if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
      isBlinking = true;
      blinkMarkTime = millis();
    } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
      isBlinking = false;
    }
    if (isBlinking) {
      faceCurrent = faceSleep;
    } else {
      faceCurrent = faceDrowsy;
    }
} else if (!isBothered && millis() > botheredMarkTime + botheredTimeout/6) {
  faceCurrent = faceAnger;
}

   position.y += sin(millis()) / 2;

  image(faceCurrent, position.x, position.y);
}
void pickTarget() {
  target = new PVector(random(margin, width-margin), random(margin, height-margin));
}
