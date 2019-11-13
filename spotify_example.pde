Table table;
// MAXIMUM SIZE IS size(1400,800)
int backgroundR, backgroundG, backgroundB;
void setup() {
  backgroundR=30;
  backgroundG=34;
  backgroundB=79;
  background(30, 34, 79);
  size(750, 510);
  smooth();
  table = loadTable("spot.csv", "header");

  for (int i = 0; i < table.getRowCount(); i++) { 
    println(table.getString(i, 6));
  }
}


void draw() {
  DisplayAllLineGraphs();
  DisplayLineGraphDanceability();
  DisplayLineGraphAcousticness();
  DisplayLineGraphLiveness();
  DisplayLineGraphEnergy();
  MainBarGraph();
}

//MAIN GRAPH CODE 
void MainBarGraph() {
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(47, 237, 98);
    strokeWeight(2);

    if (table.getInt(i, 11) == 0) { //THIS IS FOR THE MODE
      fill(0);// FILL BLACK IF MINOR. 0 = MINOR
    } else {
      fill(255);//FILL WHITE IF MAJOR. 1 = MAJOR
    }

    rect(10+(600/table.getRowCount())*i, height-table.getFloat(i, 5)*500, 600/table.getRowCount(), table.getFloat(i, 5)*500);
    //DRAWING BAR GRAPHS FOR VALENCE
    // x position top left.600/total number of rows in the table(50). Next position is * 2 then *3 *4
    // y position top left. Valence percentage. Y axis. height - getfloat. because otherwise it will draw bar graph upside down.

    /*stroke(173, 76, 230); //THIS IS LINE GRAPH FOR DANCEIBILITY. PURPLE
     strokeWeight(2);
     line(600/table.getRowCount()*i, table.getFloat(i, 6)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1/*This is used to connect points between line*/    /*, 6)*400);*/

    /*stroke(214, 166, 9); //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
     strokeWeight(2);
     line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);*/

    /*stroke(0, 255, 255);//THIS IS LINE GRAPH FOR LIVENESS. TURQUISE
     strokeWeight(2);
     line(600/table.getRowCount()*i, table.getFloat(i, 8)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*400);*/

    /* stroke(255, 0, 170);//THIS IS LINE GRAPH FOR ENERGY. PINK
     strokeWeight(2);
     line(600/table.getRowCount()*i, table.getFloat(i, 9)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 9)*400);*/
  }//END MAIN GRAPH CODE
}


void DisplayLineGraphEnergy() {
  float w = 40;
  float h = 10;
  float x = width - w*2;
  float y = 10;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    fill(255, 0, 170);
    rect(x, y, w, h);
    //THIS IS FOR THE PINK LINE GRAPH. THIS IS LINE GRAPH FOR ENERGY. PINK
    if (mousePressed) {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        fill(backgroundR, backgroundG, backgroundB);// FOR BUTTON
        rect(x, y, w, h);
        // if the mouse is inbetween button show the graph
        stroke(255, 0, 170);//THIS IS LINE GRAPH FOR ENERGY. PINK
        strokeWeight(2);
        line(600/table.getRowCount()*i, table.getFloat(i, 9)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 9)*400);
      }//else don't display it
      else {
        stroke(backgroundR, backgroundG, backgroundB, 255);
        line(600/table.getRowCount()*i, table.getFloat(i, 9)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 9)*400);
      }
    }
  }
}


void DisplayLineGraphDanceability() {
  float w = 40;
  float h = 10;
  float x = width - w*2;
  float y = h*2;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    fill(173, 76, 230);
    rect(x, y, w, h);
    //THIS IS LINE GRAPH FOR DANCEIBILITY. PURPLE
    if (mousePressed) {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        fill(backgroundR, backgroundG, backgroundB);// FOR BUTTON
        rect(x, y, w, h);
        stroke(173, 76, 230); 
        strokeWeight(2);
        line(600/table.getRowCount()*i, table.getFloat(i, 6)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 6)*400);
      } else {
        stroke(backgroundR, backgroundG, backgroundB, 255);
        line(600/table.getRowCount()*i, table.getFloat(i, 6)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 6)*400);
      }
    }
  }
}

void DisplayLineGraphAcousticness() {
  float w = 40;
  float h = 10;
  float x = width - w*2;
  float y = h*3;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    fill(214, 166, 9);
    rect(x, y, w, h);
    //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
    if (mousePressed) {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        fill(backgroundR, backgroundG, backgroundB);// FOR BUTTON
        rect(x, y, w, h);
        stroke(214, 166, 9); 
        strokeWeight(2);
        line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);
      } else {
        stroke(backgroundR, backgroundG, backgroundB, 255);
        line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);
      }
    }
  }
}

void DisplayLineGraphLiveness() {
  float w = 40;
  float h = 10;
  float x = width - w*2;
  float y = h*4;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    fill(0, 255, 255);
    rect(x, y, w, h);
    //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
    if (mousePressed) {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        fill(backgroundR, backgroundG, backgroundB);// FOR BUTTON
        rect(x, y, w, h);
        stroke(0, 255, 255);//THIS IS LINE GRAPH FOR LIVENESS. TURQUISE
        strokeWeight(2);
        line(600/table.getRowCount()*i, table.getFloat(i, 8)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*400);
      } else {
        stroke(backgroundR, backgroundG, backgroundB, 255);
        line(600/table.getRowCount()*i, table.getFloat(i, 8)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*400);
      }
    }
  }
}

void DisplayAllLineGraphs() {
  float w = 50;
  float h = 20;
  float x = width - w*2;
  float y = h*6;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    fill(120);
    rect(x, y, w, h);
    //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
    if (mousePressed) {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        fill(backgroundR, backgroundG, backgroundB);// FOR BUTTON
        rect(x, y, w, h);

        stroke(173, 76, 230); //THIS IS LINE GRAPH FOR DANCEIBILITY. PURPLE
        strokeWeight(2);
        line(600/table.getRowCount()*i, table.getFloat(i, 6)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 6)*400);
        

        stroke(214, 166, 9); //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
         strokeWeight(2);
         line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);

        stroke(0, 255, 255);//THIS IS LINE GRAPH FOR LIVENESS. TURQUISE
         strokeWeight(2);
         line(600/table.getRowCount()*i, table.getFloat(i, 8)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*400);

        stroke(255, 0, 170);//THIS IS LINE GRAPH FOR ENERGY. PINK
         strokeWeight(2);
         line(600/table.getRowCount()*i, table.getFloat(i, 9)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 9)*400);
      } else {
        stroke(backgroundR, backgroundG, backgroundB, 255);
        line(600/table.getRowCount()*i, table.getFloat(i, 6)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 6)*400);
        line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);
        line(600/table.getRowCount()*i, table.getFloat(i, 8)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*400);
        line(600/table.getRowCount()*i, table.getFloat(i, 9)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 9)*400);
      }
    }
  }
}
