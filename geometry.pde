float currentHeight = 0;
float jumpHeight = 100;
float jumpDuration = 30;
float jumpFrame = 0;
boolean jumping = false;

void setup() {
  size(840, 560);
  background(1, 52, 196);
  frameRate(60);
}

void draw() {
  background(1, 52, 196);
  
  if (jumping) {
    if (jumpFrame < jumpDuration / 2) {
      currentHeight = map(jumpFrame, 0, jumpDuration/2, 0, jumpHeight);
    } else {
      currentHeight = map(jumpFrame, jumpDuration/2, jumpDuration, jumpHeight, 0);
    }
    
    jumpFrame++;
    
    if (jumpFrame >= jumpDuration) {
      jumping = false;
      jumpFrame = 0;
    }
  }
  
  VicRukGeometry(width/2, height/2 - currentHeight);
}

void VicRukGeometry(float x, float y) {
  color insideStart = color(255, 207, 1);
  color insideEnd = color(255, 167, 0);
  color element = color(0, 255, 255);
  
  pushMatrix();
  translate(x, y);
  
  fill(0);
  stroke(0);
  strokeWeight(10);
  rect(-106, -105, 212, 212);
  
  for (int i = -100; i <= 100; i++) {
    float inter = map(i, -100, 100, 0, 1);
    color c = lerpColor(insideStart, insideEnd, inter);
    stroke(c);
    line(i, -100, i, 100);
  }

  fill(element);
  stroke(0);
  strokeWeight(7);
  rect(-60, -60, 40, 40);
  rect(20, -60, 40, 40);
  rect(-75, 5, 150, 30);
  
  popMatrix();
}

void mousePressed() {
  if (!jumping) {
    jumping = true;
  }
}
