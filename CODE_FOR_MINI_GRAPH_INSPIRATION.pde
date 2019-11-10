int[] values = { 250, 250, 250, 150, 350, 200, 250 };

void setup() {
  size(500, 500);
  strokeWeight(6);
  smooth();
}

void draw() {
  background(255);
  textAlign(CENTER, BOTTOM);
  text("CENTER,BOTTOM", 50, 30);
  float lineWidth = (float) width/(values.length-1);
  for (int i=0; i<values.length-1; i++) {
    line(i*lineWidth, values[i], (i+1)*lineWidth, values[i+1]);
  }
}

void mousePressed() {
  for (int i=0; i<values.length; i++) {
    values[i] = (int) (250 + random(-100, 100));
  }
}
