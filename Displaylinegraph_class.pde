String Buttontext;
int x, y, w, h, r, g, b, column;

class Displaylinegraph {
  void Displaylinegraph(int xpos,int ypos, int wide, int tall, int red, int green, int blue, int c, String text) {
    x = xpos;
    w = wide ;
    h = tall ;
    Buttontext = text;
    y =ypos;
    r = red;
    g= green;
    b = blue;
    column = c;
  }

  void displayindividualgraphs(int x, int y,int w, int h, int red, int green, int blue, int c,String text) {
    for (int i = 0; i < table.getRowCount()-1; i++) {
      stroke(0);
      strokeWeight(2);
      fill(red, green, blue);
      text(text, x + w, y + h/2);
      rect(x, y, w, h);
      //LINE GRAPH
      if (mousePressed) {
        if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
          fill(backgroundR, backgroundG, backgroundB);// FOR BUTTON
          rect(x, y, w, h);
          stroke(red, green, blue);  // COLOUR FOR LINE
          strokeWeight(2);
          line(600/table.getRowCount()*i, table.getFloat(i, c)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, c)*400);
        } else {
          stroke(backgroundR, backgroundG, backgroundB, 255);
          line(600/table.getRowCount()*i, table.getFloat(i, c)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, c)*400);
        }
      }
    }
  }

  void displayWholeLineGraph(int x,int y,int w, int h) {
    for (int i = 0; i < table.getRowCount()-1; i++) {
      stroke(0);
      strokeWeight(2);
      fill(255, 0, 0);
      rect(x, y, w, h);
      text(" - Click on button for a broad view of all the stats of the attributes of each song", x + w, y + h/2);

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
}
