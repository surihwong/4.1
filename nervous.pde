// Nervous Waves 2
// Levente Sandor, 2014
//https://www.openprocessing.org/sketch/153224

String file = "626-679.csv";  //not yet // 15s
Table table;
int[] opacity;
int beat;

void setup() {
  size(1920, 1080);
  //fullScreen();
  fill(0);
  noStroke();
  rectMode(CENTER);
  frameRate(24);
  noiseDetail(1, 0.9);
  
  beat = 0;

  table = loadTable(file, "header");
  opacity = new int[table.getRowCount()]; 

  for (int i = 0; i < opacity.length; i=i+1) {
    opacity[i] =int( table.getRow(i).getFloat("frustration")/100)*255;
  }
}

void draw() {
  background(0);

  for (int x = 10; x < width; x += 10) {
    for (int y = 10; y < height; y += 10) {

      float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
      pushMatrix();
      translate(x, y);
      rotate(TWO_PI * n);
      scale(10 * n);
      for (int i = 0; i < opacity.length; i=i+1) {
      fill(color(191, 8, 186, 120),opacity[i]);//opacity[i]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      }
      rect(0, 0, 2, 2);
      popMatrix();
    }
  }
  
  beat++;
  if ( beat == 24*15 ){
    exit();
  }
  saveFrame("data/screen-1080/####.jpg");
}

void mousePressed() {
  exit();
}