Table table;
// MAXIMUM SIZE IS size(1400,800)
void setup() {

  size(700, 510);
  smooth();
  table = loadTable("spot.csv", "header");

  for (int i = 0; i < table.getRowCount(); i++) { 
    println(table.getString(i, 6));
  }
}


void draw() {


  for (int i = 0; i < table.getRowCount()-1; i++) {

    stroke(100);
    strokeWeight(1);

    if (table.getInt(i, 11) == 0) { //THIS IS FOR THE MODE
      fill(0);// FILL BLACK IF MINOR. 0 = MINOR
    } else {
      fill(255);//FILL WHITE IF MAJOR. 1 = MAJOR
    }

    rect(10+(600/table.getRowCount())*i, height-table.getFloat(i, 5)*500, 600/table.getRowCount(), table.getFloat(i, 5)*500);
    //DRAWING BAR GRAPHS FOR VALENCE
    // x position top left.600/total number of rows in the table(50). Next position is * 2 then *3 *4
    // y position top left. Valence percentage. Y axis. height - getfloat. because otherwise it will draw bar graph upside down.

    stroke(128, 0, 128); //THIS IS LINE GRAPH FOR DANCEIBILITY. PURPLE
    strokeWeight(2);
    line(600/table.getRowCount()*i, table.getFloat(i, 6)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1/*This is used to connect points between line*/, 6)*400);

    stroke(214, 166, 9); //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
    strokeWeight(2);
    line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);

    stroke(0, 255, 255);//THIS IS LINE GRAPH FOR LIVENESS. TURQUISE
    strokeWeight(2);
    line(600/table.getRowCount()*i, table.getFloat(i, 8)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*400);

    stroke(255, 0, 170);//THIS IS LINE GRAPH FOR ENERGY. PINK
    strokeWeight(2);
    line(600/table.getRowCount()*i, table.getFloat(i, 9)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 9)*400);
  }


  //CLICKING ON EACH BAR
  // if mousepressed on button switch off line graph. 

  // CREATE AN ARRAY FOR COLOURS
  int[] buttoncolours = {128, 0, 128, 214, 166, 9, 0, 255, 255, 255, 0, 170};

  float x = 0;
  float y = 0;
  float w = 100;
  float h = 10;
  // DRAWS 4 BUTTONS 
  for (int i=0; i<5; i++) {
    stroke(0);
    //fill(buttoncolours[i], buttoncolours[i+1], buttoncolours[i+2]);
    //rect(x, y, w, h);
    x = x + w;
    w =+ 100; 
    if (mousePressed) {
      if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
        println("The mouse is pressed and over the button");
        fill(0);
      }
    }
  }
  AXIS();
}



//HERE IS THE AXIS FOR VALENCE
void AXIS() {
  int bigxaxis = 700;
  int bigyaxis = 700;
  stroke(100);
  strokeWeight(4);
  line(0, 0, 0, bigyaxis);
  line(0, bigyaxis, bigxaxis, bigyaxis);
}




//}
