Table table;

void setup() {

  size(600, 600);

  table = loadTable("spot.csv", "header");

  for (int i = 0; i < table.getRowCount(); i++) { 
    println(table.getString(i, 6));
  }
}


void draw() {

  for (int i = 0; i < table.getRowCount()-1; i++) {

    stroke(0);
    strokeWeight(1);

    if (table.getInt(i, 11) == 0) { //THIS IS FOR THE MODE
      fill(0);// FILL BLACK IF MINOR. 0 = MINOR
    } else {
      fill(255);//FILL WHITE IF MAJOR. 1 = MAJOR 
    }

    rect((width/table.getRowCount())*i, height-table.getFloat(i, 6)*500, width/table.getRowCount(), table.getFloat(i, 6)*500);
    //DRAWING BAR GRAPHS FOR VALENCE
    // x position top left.600/total number of rows in the table(50). Next position is * 2 then *3 *4
    // y position top left. Valence percentage. Y axis. height - getfloat. because otherwise it will do it upside down.
    
    stroke(255, 0, 0);
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 5)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1, 5)*500);

    stroke(0, 255, 0);
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 5)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1, 5)*500);

    stroke(0, 0, 255);
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 7)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*500);

    stroke(255, 255, 0);
    strokeWeight(2);
    line(width/table.getRowCount()*i, table.getFloat(i, 8)*500, width/table.getRowCount()*(i+1), table.getFloat(i+1, 8)*500);
    
  }
}
