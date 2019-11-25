Songdetails[] songfeatures; //CREATES AN ARRAY OF OBJECTS FOR SONG FEATURES

PImage spotifylogo; //IMAGE FOR SPOTIFY LOGO
Table table; // INITIALISE TABLE FOR CSV FILE
float w = 80;
float h = 30;
float x = 625;
int songindex;
int backgroundR, backgroundG, backgroundB;

void setup() {
  spotifylogo = loadImage("spotifylogo.png"); //loads spotify logo
  backgroundR=30;
  backgroundG=34;
  backgroundB=79;
  size(1300, 700);
  table = loadTable("Top Spotify Tracks of 2018.csv", "header"); //LOADS CSV FILE
  //Array of object Songdetails used in songattributesdisplay() procedure
  songfeatures = new Songdetails[table.getRowCount()];//Make array and then set length of array from the amount of rows from table
}

void draw() {
  background(30, 34, 79); //MAIN BACKGROUND IS DARK BLUE
  image(spotifylogo, 1100, 60); //IMPORT SPOTIFY LOGO
  spotifylogo.resize(0,110); //RESIZE SPOTIFY LOGO SO IT IS SMALLER AND FITS IN THE CORNER
  bgtitle(); //TITLE FOR BAR GRAPH
  keybox();// BLUE BOX FOR KEYS & BUTTONS
  linegraphs();// WHEN MOUSECLICKED IT DISPLAYS ALL LINEGRAPHS
  acousticness(); // WHEN MOUSECLICKED DISPLAYS ACOUSTICNESS LINE GRAPH
  liveness();  // WHEN MOUSECLICKED DISPLAYS LIVENESS LINE GRAPH
  danceability();  //WHEN MOUSECLICKED DISPLAYS DANCEABILITY LINE GRAPH
  energy();  //WHEN MOUSECLICKED DISPLAYS ACOUSTICNESS LINE GRAPH
  bargraph();  // DISPLAYS MAIN BAR GRAPH 
  Yaxis(); // DRAWS Y AXIS 
  modesinkeybox(); //Displays Minor and Major keys in keybox
  songboxdisplay(); // BLUE BOX FOR song details
  songsdisplay(songindex); //Displays song details
}

//DISPLAYS MAIN TITLE OF THE BAR GRAPH
void bgtitle() {
  fill(47, 237, 98);
  text("<-Spotify's Top 50 (from left to right) Tracks of 2018 and the valence percentage (Y-Axis)", 610, 14);
}

void Yaxis() {
  fill(47, 237, 98);
  //stroke(0);
  strokeWeight(2);
  rect(0, 0, 5, height);
}

void keybox() {
  noFill();
  strokeWeight(5);
  stroke(50, 100, 165);
  rect(620, 40, 500+h*5, 50 *(5));
  textSize(15);
  fill(240);
  text("KEYS & BUTTONS", 625+ (CENTER/4), 55);
}

void mouseMoved() { 
  //WHEN USER HOVERS ON BAR GRAPH IT DSPLAYS THE SONG DETAILS FOR EACH BAR GRAPH
    float[] BarposX = new float [table.getRowCount()];
    float[] BarposY = new float [table.getRowCount()];
    float[] Barwidth = new float [table.getRowCount()];
    float[] Barheight = new float [table.getRowCount()];
    for (int i = 0; i< table.getRowCount(); i++) {
      BarposX[i] = 10+(600/table.getRowCount())*i;
      BarposY[i] = table.getFloat(i, 5);
      Barwidth[i] =600/table.getRowCount();
      Barheight[i] = table.getFloat(i, 5)*500;
      noFill();
      //rect(10+(600/table.getRowCount())*i, height-table.getFloat(i, 5)*500, 600/table.getRowCount(), table.getFloat(i, 5)*500); WHAT DOES THIS DO?
      if (mouseX > BarposX[i] &&  mouseY > BarposY[i] ) {
        songindex = i;
      }
    }
  }

//MAIN GRAPH CODE 
void bargraph() {
  //DRAWING BAR GRAPHS FOR VALENCE
  // x position top left.600/total number of rows in the table(50). Next position is * 2 then *3 *4
  // y position top left. Valence percentage. Y axis. height - getfloat. because otherwise it will draw bar graph upside down.
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(47, 237, 98);
    strokeWeight(2);

    if (table.getInt(i, 11) == 0) { //THIS IS FOR THE MODE
      fill(50);// FILL BLACK IF MINOR. 0 = MINOR
    } else {
      fill(255);//FILL WHITE IF MAJOR. 1 = MAJOR
    }
    rect(10+(600/table.getRowCount())*i, height-table.getFloat(i, 5)*500, 600/table.getRowCount(), table.getFloat(i, 5)*500);
  }
}

void energy() {
  float y = 60;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    fill(255, 0, 170);
    rect(x, y, w, h);
    text(" - Hold on button for the stats on energy", x + w, y + h/2);
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

void danceability() {
  float y = 60 + h;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    fill(173, 76, 230);
    rect(x, y, w, h);
    text(" - Hold on button for the stats on danceability", x + w, y + h/2);
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

void acousticness() {
  float y = 60 + h*2;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    fill(214, 166, 9);
    text(" - Hold on button for the stats on acousticness", x + w, y + h/2);
    rect(x, y, w, h);
    //THIS IS LINE GRAPH FOR ACOUSTICNESS. BURNT ORANGE
    if (mousePressed) { //IF MOUSE CLICKED
      if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) { //IF MOUSE IS IN BETWEEN BOUNDARIES OF BUTTON
        fill(backgroundR, backgroundG, backgroundB);// CHANGES COLOUR OF BUTTON WHEN CLICKED
        rect(x, y, w, h); //
        stroke(214, 166, 9);  // COLOUR FOR LINE
        strokeWeight(2);
        line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);
      } else {
        stroke(backgroundR, backgroundG, backgroundB, 255);
        line(600/table.getRowCount()*i, table.getFloat(i, 7)*400, 600/table.getRowCount()*(i+1), table.getFloat(i+1, 7)*400);
      }
    }
  }
}

void liveness() {
  float y = 60 + h*3;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    fill(0, 255, 255);
    text(" - Hold on button for the stats on liveness ", x + w, y + h/2);
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

void linegraphs() {
  float w = 50;
  float h = 30;
  float y = 60 + h*4;
  for (int i = 0; i < table.getRowCount()-1; i++) {
    fill(255, 0, 0);
    rect(x, y, w, h);
    text(" - Hold on button for a broad view of all the stats of the attributes of each song", x + w, y + h/2);

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

// DISPLAY MAJOR AND MINOR MODE KEYS IN BOX 
void  modesinkeybox() {
  float y = 60 + h*5;
  // BAR KEYS
  stroke(47, 237, 98);
  strokeWeight(2);
  fill(255);//MAJOR KEY BAR GRAPH KEY
  rect(x, 60+h*5+(2), 20, 20);
  text("--- MAJOR (1) MODE ", x + w, y + h/2);

  y = 60 + h*6;
  fill(50);//MINOR KEY BAR GRAPH KEY
  rect(x, 60+h*6, 20, 20);
  fill(240);
  text("--- MINOR (0) MODE ", x + w, y + h/2);
}

//SONG DETAILS BOX
void songboxdisplay() {
  noFill();
  strokeWeight(5);
  stroke(50, 100, 165);
  rect(620, 300, 500+h*5, 50 *(7.5));
}

void songsdisplay(int songindex) {
  for (int i=0; i< table.getRowCount(); i++) {
    songfeatures[i] = new Songdetails(table.getInt(i, 0), table.getString(i, 1), table.getString(i, 4), table.getString(i, 3), table.getString(i, 10), table.getInt(i, 2), table.getInt(i, 11), table.getFloat(i, 5), table.getFloat(i, 6), table.getFloat(i, 7), table.getFloat(i, 8), table.getFloat(i, 9));//Add data (Objects) to array
    int Textxpos = 620; // ALIGNS X POSTION OF TEXT WITHIN THE BOX
    fill(150);
    textSize(18);
    text("  Spotify Ranking:" + " " + songfeatures[songindex].spotifyranking, Textxpos, 320);
    textSize(17);
    text("  Artist:" +  " " + songfeatures[songindex].artists, Textxpos, 340);
    textSize(14);
    text("  Song Title:" +  " " + songfeatures[songindex].name, Textxpos, 360);
    text("  Genre:" +  " " + songfeatures[songindex].genre, Textxpos, 380);
    text("  Key Signature:" +  " " + songfeatures[songindex].keysignature, Textxpos, 400);
    text("  Tempo: " +  " " + songfeatures[songindex].tempo, Textxpos, 420);
    text("  Mode:"+ " " + songfeatures[songindex].mode, Textxpos, 440);
    fill(47, 237, 98);
    text("  Valence:" + " " + songfeatures[songindex].valence *100 + "%", Textxpos, 460);// DRAW CIRCLES??
    fill(173, 76, 230);
    text("  Danceability:" + " " + songfeatures[songindex].danceability *100 + "%", Textxpos, 480);
    fill(214, 166, 9); 
    text("  Acousticness:" + " " + songfeatures[songindex].acousticness *100 + "%", Textxpos, 500);
    fill(0, 255, 255);
    text("  Liveness:" + " " + songfeatures[songindex].liveness *100 + "%", Textxpos, 520);
    fill(255, 0, 170); 
    text("  Energy:" + " " + songfeatures[songindex].energy *100 + "%", Textxpos, 540);
    bubblevisualisation();
    Questionsforusers();
  }
}

//QUESTIONS FOR USERS TO THINK ABOUT WHEN LOOKING AT THE DATA
void Questionsforusers() {
  fill(47, 237, 98);
  text("Why is the valence of the song not in accordance to the ranking?", x, 610);
  fill(255);
  text("  Wouldn't you think... the more optimistic the song... the more listens? ", x, 630);
  text("    What other attributes of a song make it popular...", x, 650);
  fill(47, 237, 98);
  text("    Slide the mouse over each bar on bar graph to show the bubble visualisation for each song", x, 670);
}

// DISPLAYS BUBBLE VISUALISATUON FOR EACH SONG
void bubblevisualisation() { 
  fill(47, 237, 98); //CIRCLE FOR VALENCE
  ellipse(1110, (400+520)/2, songfeatures[songindex].valence * 100, songfeatures[songindex].valence * 100);
  noFill();
  stroke(47, 237, 98);
  strokeWeight(2); // CIRCLE OUTLINE FOR VALENCE
  ellipse(1110, (400+520)/2, songfeatures[songindex].valence * 200, songfeatures[songindex].valence * 200);
  noStroke();
  fill(173, 76, 230); //CIRCLE FOR DANCEABILITY
  ellipse(1000, 520, songfeatures[songindex].danceability * 100, songfeatures[songindex].danceability * 100);
  fill(214, 166, 9); //CIRCLE FOR ACOUSTICNESS
  ellipse(1000, 400, songfeatures[songindex].acousticness * 100, songfeatures[songindex].acousticness * 100);
  fill(0, 255, 255); //CIRCLE FOR LIVENESS
  ellipse(1200, 400, songfeatures[songindex].liveness * 100, songfeatures[songindex].liveness * 100);
  fill(255, 0, 170); //CIRCLE FOR ENERGY
  ellipse(1200, 520, songfeatures[songindex].energy * 100, songfeatures[songindex].energy * 100);
}
