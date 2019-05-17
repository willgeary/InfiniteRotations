RegularPolygon poly;
int scenario = 4; // scenario 4 = square, 5 = pentagon, etc...
float radius = 350;
float shrinkFactor;
float strokeWeight = 1.0;
float strokeSoften;
float numAngles;
float numPolygons;
float rotation;
float initRot;
// Golden ratio: https://www.mathsisfun.com/numbers/golden-ratio.html
float goldenRatio = 1.61803398875;

void setup() {
  size(800,800);
  pixelDensity(2); //higher resolution output
  noFill();
  stroke(0);
  noLoop();
  
  if (scenario == 3) {
    shrinkFactor = 0.50;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 1000;
    rotation = PI;
    initRot = -PI/2;
  }
  
  if (scenario == 4) {
    shrinkFactor = 0.955;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 1000;
    rotation = goldenRatio;
    initRot = -PI/4;
  }
  
  if (scenario == 5) {
    shrinkFactor = 0.835;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 40;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
  
  if (scenario == 6) {
    shrinkFactor = 0.865;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 100;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
  
  if (scenario == 7) {
    shrinkFactor = 0.935;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 100;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
  
  if (scenario == 8) {
    shrinkFactor = 0.980;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 400;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
  
  if (scenario == 9) {
    shrinkFactor = 0.945;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 200;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
  
  if (scenario == 10) {
    shrinkFactor = 0.950;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 200;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
  
  if (scenario == 11) {
    shrinkFactor = 0.975;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 300;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
  
  if (scenario == 12) {
    shrinkFactor = 0.986;
    strokeSoften = 0.90;
    numAngles = scenario;
    numPolygons = 500;
    rotation = goldenRatio;
    initRot = -PI/8;
  }
}

void draw() {
  background(255); // white background
  translate(width/2, height/2); // move to center of canvas
  
  strokeWeight(strokeWeight);
  ellipse(0, 0, radius*2, radius*2);
  
  rotate(initRot);
  poly = new RegularPolygon(0,0,radius,numAngles);
  poly.init();
  poly.show();
  
  for (int i=0; i<numPolygons; i++) {
    rotate(rotation);
    radius = radius * shrinkFactor;
    strokeWeight = strokeWeight * strokeSoften;
    strokeWeight(strokeWeight);
    poly = new RegularPolygon(0,0,radius,numAngles);
    poly.init();
    poly.show();
  }
}

void mousePressed() {
  saveFrame("../frames/frame_" + int(numAngles) + ".png");
}