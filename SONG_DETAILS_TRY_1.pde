float h = 30;
Table table;
Songdetails[] songfeatures;//Array of object Songdetails(No length as yet)

void setup() {
  background(30, 34, 79);
  size(1300, 700);

  table = loadTable("spot3Reorganisefield.csv", "header");//import table
  int index = table.getRowCount(); 
  songfeatures = new Songdetails[index];//Make array set length of array from the amount of rows from table 

  for (int i=0; i< index; i++) {
    songfeatures[i] = new Songdetails(table.getInt(i, 0), table.getString(i, 1)/*,table.getString(i, 2), table.getString(i, 3), table.getString(i, 4),table.getInt(i, 5)*/);//Add data (Objects) to array
   // println(songfeatures[i].spotifyranking + "," ,songfeatures[i].artists + ",",songfeatures[i].name + ",", songfeatures[i].genre + ",", songfeatures[i].tempo + "," , songfeatures[i].keysignature + "," );//Print variable name and age for each object
  }
}

void draw() {
  noFill();
  strokeWeight(5);
  stroke(50, 100, 165);
  rect(620, 300, 500+h*5, 50 *(7.5));
  fill(150);
  textSize(14);
  text("  Spotify Ranking:" + " " + songfeatures[0].spotifyranking, 620, 320);
  text("  Artist:" +  " " + songfeatures[0].artists, 620, 340);
  text("  Song Title:" +  " " + songfeatures[0].name, 620, 360);
  text("  Genre:" +  " " + songfeatures[0].genre, 620, 380);
  text("  Key:" +  " " + songfeatures[0].keysignature, 620, 400);
  text("  Tempo: " +  " " + songfeatures[0].tempo, 620, 420);
  text("  Mode:"+ " " + songfeatures[0].mode, 620, 440);
  text("  Valence:" + " " + songfeatures[0].valence, 620, 460);// DRAW CIRCLES
  
  /*text("  Danceability:", 620, 480);
  text("  Acousticness: ", 620, 480);
  text("  Liveness:", 620, 500);
  text("  Energy:  ", 620, 520);*/
}
