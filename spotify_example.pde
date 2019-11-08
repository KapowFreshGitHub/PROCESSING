Table table;
// MAXIMUM SIZE IS size(1400,800)
void setup() {

  size(700, 700);
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

    rect(10+(width/table.getRowCount())*i, height-table.getFloat(i, 5)*500, width/table.getRowCount(), table.getFloat(i, 5)*500);
    //DRAWING BAR GRAPHS FOR VALENCE
    // x position top left.600/total number of rows in the table(50). Next position is * 2 then *3 *4
    // y position top left. Valence percentage. Y axis. height - getfloat. because otherwise it will draw bar graph upside down.

    stroke(128, 0, 128); //THIS IS LINE GRAPH FOR DANCEIBILITY. PURPLE
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 6)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1/*This is used to connect points between line*/, 6)*500);

    stroke(214, 166, 9); //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 7)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*500);

    stroke(0, 255, 255);//THIS IS LINE GRAPH FOR LIVENESS. TURQUISE
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 8)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*500);

    stroke(255, 0, 170);//THIS IS LINE GRAPH FOR ENERGY. PINK
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 9)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1, 9)*500);
  }

  //HERE IS THE AXIS FOR VALENCE

  int bigxaxis, bigyaxis;
  bigxaxis = 700;
  bigyaxis = 700;
  stroke(255, 0, 0);
  strokeWeight(10);
  line(0, 0, 0, bigyaxis);
  line(0, bigyaxis, bigxaxis, bigyaxis);
}
