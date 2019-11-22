Songdetails[] songfeatures; // OBJECTS FOR SONG FEATURES (SHOWN AS TEXT ON SKETCH

Table table;
int songindex;
int backgroundR=30;
int backgroundG=34;
int backgroundB=79;

void setup() {
  size(1300, 700);
  table = loadTable("spot2.csv", "header");
  //Array of object Songdetails(No length as yet) used in songattributesdisplay() procedure
  songfeatures = new Songdetails[table.getRowCount()];//Make array set length of array from the amount of rows from table
}

void draw() {
  background(30, 34, 79);
  DisplayTitle();
  DisplayKeys();
  DisplayAllLineGraphs();
  MainBarGraph();
  DrawYaxis();
  DisplayMinorandMajorkeyinkeybox();
  songboxdisplay();
  songattributesdisplay(songindex);
}

void DisplayTitle() {
  fill(47, 237, 98);
  text("<-Spotify's Top 50 (from left to right) Tracks of 2018 and it's valence percentage (Y-Axis)", 610, 14);
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

void mouseMoved() {
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
    rect(10+(600/table.getRowCount())*i, height-table.getFloat(i, 5)*500, 600/table.getRowCount(), table.getFloat(i, 5)*500);
    if (mouseX > BarposX[i] &&  mouseY > BarposY[i] ) {
      songindex = i;
      println(songindex);
      println(BarposX[i]);
    }
  }
}


//MAIN GRAPH CODE 
void MainBarGraph() {
  for (int i = 0; i < table.getRowCount()-1; i++) {
    stroke(47, 237, 98);
    strokeWeight(2);

    if (table.getInt(i, 11) == 0) { //THIS IS FOR THE MODE
      fill(50);// FILL BLACK IF MINOR. 0 = MINOR
    } else {
      fill(255);//FILL WHITE IF MAJOR. 1 = MAJOR
    }

    rect(10+(600/table.getRowCount())*i, height-table.getFloat(i, 5)*500, 600/table.getRowCount(), table.getFloat(i, 5)*500);//DRAWS BAR GRAPH FOR VALENCE OF SONG
  }//END MAIN GRAPH CODE
}


void DisplayAllLineGraphs() {
  int xbuttonpos = 625;// X POSITION FOR ALL BUTTONS
  int ybuttonpos = 60;//the y position will change each time so must be changed
  int redbuttonwidth = 50; //WIDTH FOR RED BUTTON diferent to all the other buttons
  int h = 30; //HEIGHT FOR ALL BUTTON

  int buttonwidth = 80;
  //DISPLAYS GRAPH WITH PINK BUTTON (ENERGY)
  ybuttonpos = 60 ;
  int r = 255;
  int g = 0;
  int b = 170;
  int c = 9;
  String text = " - Click on button for the stats on energy";
  Displaylinegraph energy = new Displaylinegraph(); //MAKES OBJECT FOR ENERGY 
  energy.displayindividualgraphs(xbuttonpos, ybuttonpos, buttonwidth, h, r, g, b, c, text);

  ybuttonpos = 60 + h;
  r = 173;
  g = 76;
  b = 230;
  column = 6;
  text = " - Click on button for the stats on Danceability";
  Displaylinegraph danceability = new Displaylinegraph(); //MAKES OBJECT FOR DANCEABILITY 
  danceability.displayindividualgraphs(xbuttonpos, ybuttonpos, buttonwidth, h, r, g, b, c, text);

  ybuttonpos = 60 + h*2;
  r = 214;
  g = 166;
  b = 9;
  column = 7;
  text = " - Click on button for the stats on acousticness";
  Displaylinegraph acousticness = new Displaylinegraph(); //MAKES OBJECT FOR ACOUSTICNESS 
  acousticness.displayindividualgraphs(xbuttonpos, ybuttonpos, buttonwidth, h, r, g, b, c, text);

  ybuttonpos = 60 + h*3;
  y = 60 + h*3;
  r = 0;
  g = 255;
  b = 255;
  column = 8;
  text = " - Click on button for the stats on liveness";
  Displaylinegraph liveness = new Displaylinegraph(); //MAKES OBJECT FOR LIVENESS
  liveness.displayindividualgraphs(xbuttonpos, ybuttonpos, buttonwidth, h, r, g, b, c, text);

  //DISPLAYS GRAPH WITH RED BUTTON (GENERAL OVERVIEW)
  ybuttonpos = 60 + h*4;
  Displaylinegraph maingraph = new Displaylinegraph();
  maingraph.displayWholeLineGraph(xbuttonpos, ybuttonpos, redbuttonwidth, h);
}

void  DisplayMinorandMajorkeyinkeybox() {
  float Ymajminpos = 60 + h*5;
  // BAR KEYS
  stroke(47, 237, 98);
  strokeWeight(2);
  fill(255);//MAJOR KEY BAR GRAPH KEY
  rect(625, 60+h*4+(2), 20, 20);
  text("--- MAJOR MODE ", 625 + 80, Ymajminpos + 30/2);

  Ymajminpos = 60 + h*6;
  fill(50);//MINOR KEY BAR GRAPH KEY
  rect(625, 60+h*6, 20, 20);
  fill(240);
  text("--- MINOR MODE ", 625 + 80, Ymajminpos + 30/2);
}

// SONG DETAILS DISPLAY CODE
void songboxdisplay() {
  noFill();
  strokeWeight(5);
  stroke(50, 100, 165);
  rect(620, 300, 500+h*5, 50 *(7.5));
}


void songattributesdisplay(int songindex) {
  for (int i=0; i< table.getRowCount(); i++) {
    songfeatures[i] = new Songdetails(table.getInt(i, 0), table.getString(i, 1), table.getString(i, 4), table.getString(i, 3), table.getString(i, 10), table.getInt(i, 2), table.getInt(i, 11), table.getFloat(i, 5), table.getFloat(i, 6), table.getFloat(i, 7), table.getFloat(i, 8), table.getFloat(i, 9), table.getInt(i, 12), table.getFloat(i, 13));//Add data (Objects) to array
    int Textxpos = 620;

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
    text("  Valence:" + " " + songfeatures[songindex].valence *100 + "%", Textxpos, 460);
    fill(173, 76, 230);
    text("  Danceability:" + " " + songfeatures[songindex].danceability *100 + "%", Textxpos, 480);
    fill(214, 166, 9); 
    text("  Acousticness:" + " " + songfeatures[songindex].acousticness *100 + "%", Textxpos, 500);
    fill(0, 255, 255);
    text("  Liveness:" + " " + songfeatures[songindex].liveness *100 + "%", Textxpos, 520);
    fill(255, 0, 170); 
    text("  Energy:" + " " + songfeatures[songindex].energy *100 + "%", Textxpos, 540);
    bubblevisualisation();
    titleforbubblevisualisation();
  }
}
void titleforbubblevisualisation() {
  fill(47, 237, 98);
  text("Bubble Visual: Showing the effect of each attribute to valence", 800, 590);
}

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
