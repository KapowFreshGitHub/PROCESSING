//BUTTONS ON GRAPH
Button Energy_button; 
Button Danceability_button;
Button Acousticness_button;
Button Liveness_button;// the button
int[] clk = new int[4];       // number of times the button is clicked

void setup() {
  size (500, 500);
  smooth();

  // create the button object
  int viewbuttonwidth = width - 100;
  Energy_button = new Button("Energy", viewbuttonwidth, 20, 100, 50);
  Danceability_button = new Button("Danceability", viewbuttonwidth, 20+50, 100, 50);
  Acousticness_button = new Button("Acousticness", viewbuttonwidth, 20+100, 100, 50);
  Liveness_button = new Button("Liveness", viewbuttonwidth, 20+150, 100, 50);
}

void draw() {
  // draw the button in the window
  Energy_button.DrawonWindow();
  Danceability_button.DrawonWindow();
  Acousticness_button.DrawonWindow();
  Liveness_button.DrawonWindow();
}

// mouse button clicked
// REMOVE SPECIFIC LINE GRAPH
void mousePressed()
{
  if (Energy_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Clicked: ");
    clk[0]++;
    println(clk[0]);
  }
  if (Danceability_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Clicked: ");
    clk[1]++;
    println(clk[1]);
  }
  if (Acousticness_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Clicked: ");
    clk[2]++;
    println(clk[2]);
  }
  if (Liveness_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Clicked: ");
    clk[3]++;
    println(clk[3]);
  }
}

// the Button class
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button

  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }

  void DrawonWindow() {
    for (int i=0; i<5; i++) {
      fill(254);
      rect(x, y, w, h, 10);
      textAlign(CENTER, CENTER);
      stroke(0);
      fill(0);
      text(label, x + (w / 2), y + (h / 2));
    }
  }

  boolean MouseIsOver() {
    if (mousePressed) {
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
        return true;
      }
      return false;
    }
  }
}
//HOW DO I CHANGE COLOUR OF BUTTON WHEN CLICKED AS WELL AS REMOVING GRAPH WHEN USER HAS CLICKED
// HOW DO I CREATE THIRD AXIS FOR KEYS & BE ABLE TO SWITCH OFF THE AXIS
//ALSO HOW DO I INTEGRATE BUTTON WITH GRAPH ON SAME WINDOW
