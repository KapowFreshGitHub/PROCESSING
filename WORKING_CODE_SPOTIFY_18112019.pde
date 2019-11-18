Table table;
float w = 80;
float h = 30;
float x = 625;
// MAXIMUM SIZE IS size(1400,800)
int backgroundR, backgroundG, backgroundB;
void setup() {
  backgroundR=30;
  backgroundG=34;
  backgroundB=79;
  size(1300, 700);
  smooth();
  table = loadTable("spot2.csv", "header");
println(table.getRowCount());
for (int i = 0; i < table.getRowCount(); i++) { 
    println(table.getString(i, 6));
  }
}

void draw() {
  background(30, 34, 79);
  DisplayTitle();
  DisplayKeys();
  DisplayAllLineGraphs();
  DisplayLineGraphAcousticness();
  DisplayLineGraphLiveness();
  DisplayLineGraphDanceability(); //if you hold the button down you can see 
  DisplayLineGraphEnergy();
  MainBarGraph();
  DrawYaxis();
  DisplaydetailsforeachBar();
}

void DisplayTitle() {
  //600 is middle
 // PFont mono = createFont("Gotham-Book.otf", 14);
 // textFont(mono);
  fill(47, 237, 98);
  text("<-Spotify's Top 48 (from left to right) Tracks of 2018 and song attributes in relation to valence", 610, 14);
}

void DrawYaxis() {
  fill(47, 237, 98);
  //stroke(0);
  strokeWeight(2);
  rect(0, 0, 5, height);
}

void DisplayKeys() {
  noFill();
  strokeWeight(5);
  stroke(50, 100, 165);
  rect(620, 40, 500+h*5, 50 *(5));
  textSize(15);
  fill(240);
  text("KEYS", 625+ (CENTER/4), 55);
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
  float y = 60;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    //stroke(0);
    //strokeWeight(2);
    fill(255, 0, 170);
    rect(x, y, w, h);
    text(" - Click on button for the stats on energy", x + w, y + h/2);
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
  float y = 60 + h;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    strokeWeight(2);
    fill(173, 76, 230);
    rect(x, y, w, h);
    text(" - Click on button for the stats on danceability", x + w, y + h/2);
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
  float y = 60 + h*2;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    strokeWeight(2);
    fill(214, 166, 9);
    text(" - Click on button for the stats on acousticness", x + w, y + h/2);
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
  float y = 60 + h*3;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    strokeWeight(2);
    fill(0, 255, 255);
    text(" - Click on button for the stats on liveness ", x + w, y + h/2);
    rect(x, y, w, h);
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
  float h = 30;
  float y = 60 + h*4;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(0);
    strokeWeight(2);
    fill(120);
    rect(x, y, w, h);
    text(" - Click on button for a broad view of all the stats of the attributes of each song", x + w, y + h/2);
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

void DisplaydetailsforeachBar() {
  noFill();
  strokeWeight(5);
  stroke(50, 100, 165);
  // rect(620, 40, 500+h*5, 50 *(5));
  rect(620, 300, 500+h*5, 50 *(5));

  // BAR KEYS
  stroke(47, 237, 98);
  strokeWeight(2);
  fill(255);//MAJOR KEY BAR GRAPH KEY
  rect(x, 60+h*5+(2), 20, 20);
  //text(" - Click on button for a broad view of all the stats of the attributes of each song", x + w, y + h/2);

  fill(0);//MINOR KEY BAR GRAPH KEY
  rect(x, 60+h*6, 20, 20);

//SONG DETAILS

  float mouseposition = mouseX/100;
  // divide mousex position by 100. So that it's inbetween range ranking of song
  // if result is between ranking then
  for (int i =0; i < 48; i++) {
    if (mousePressed) {
      if (mouseposition >=i && mouseposition <=i++) {
        int R, G, B;
        R = int(random(0, 255));
        G = int(random(0, 255));
        B = int(random(0, 255));
        fill(R, G, B);
      }
      }
    }   // display content for song
  }
