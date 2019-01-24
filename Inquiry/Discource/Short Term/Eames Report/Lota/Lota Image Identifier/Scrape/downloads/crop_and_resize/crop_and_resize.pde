import gab.opencv.*;
import controlP5.*;
ControlP5 cp5;
float contrast=0;
int blur=1;

PImage src, dst;
OpenCV opencv;
int thresold=100;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  
  
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("thresold")
     .setPosition(100,50)
     .setRange(0,100)
     ;
  cp5.addSlider("contrast")
     .setPosition(100,60)
     .setRange(0,1)
     ;
  cp5.addSlider("blur")
     .setPosition(100,70)
     .setRange(1,20)
     ;
     
  src = loadImage("1.jpg"); 
  size(1080, 360);
  opencv = new OpenCV(this, src);


}


void update()
{
  opencv.gray();
  opencv.blur(blur);
  opencv.contrast(contrast);
  opencv.threshold(thresold);

  dst = opencv.getOutput();

  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
}

void draw() {
  update();
  image(src, 0, 0);
  image(dst, src.width, 0);

  noFill();
  strokeWeight(3);
  
  for (Contour contour : contours) {
    stroke(0, 255, 0);
    contour.draw();
    
    stroke(255, 0, 0);
    beginShape();
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
      vertex(point.x, point.y);
    }
    endShape();
  }
}
