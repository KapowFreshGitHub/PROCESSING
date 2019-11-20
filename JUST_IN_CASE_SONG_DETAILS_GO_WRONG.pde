/*//JUST IN CASE ANYTHING GOES WRONG
//SONG DETAILS
//Songdetails[] songfeatures;

//void setup() {
//background(30, 34, 79);
//size(1300, 700);

//table = loadTable("spot2.csv", "header");//import table
//songfeatures = new Songdetails[table.getRowCount()];//Make array set length of array from the amount of rows from table (UP AT TOP)
//}

//void draw() {
// songattributesdisplay();
//}

//void songattributesdisplay() {
  // mouseclickedbetweenbargraph
  for (int i=0; i< table.getRowCount(); i++) {
    songfeatures[i] = new Songdetails(table.getInt(i, 0), table.getString(i, 1), table.getString(i, 4), table.getString(i, 3), table.getString(i, 10), table.getInt(i, 2), table.getInt(i, 11), table.getFloat(i, 5), table.getFloat(i, 6), table.getFloat(i, 7), table.getFloat(i, 8), table.getFloat(i, 9), table.getInt(i, 12), table.getFloat(i, 13));//Add data (Objects) to array
    //println(songfeatures[i].spotifyranking + ",", songfeatures[i].artists + ",", songfeatures[i].name + ",", songfeatures[i].genre + ",", songfeatures[i].keysignature + ",", songfeatures[i].tempo + ",", songfeatures[i].mode + ",");//Print variable name and age for each object

    noFill();
    strokeWeight(5);
    stroke(50, 100, 165);
    rect(620, 300, 500+h*5, 50 *(7.5));
    fill(150);
    textSize(14);
    text("  Spotify Ranking:" + " " + songfeatures[i].spotifyranking, 620, 320);
    text("  Artist:" +  " " + songfeatures[i].artists, 620, 340);
    text("  Song Title:" +  " " + songfeatures[i].name, 620, 360);
    text("  Genre:" +  " " + songfeatures[i].genre, 620, 380);
    text("  Key Signature:" +  " " + songfeatures[i].keysignature, 620, 400);
    text("  Tempo: " +  " " + songfeatures[i].tempo, 620, 420);
    text("  Mode:"+ " " + songfeatures[i].mode, 620, 440);
    text("  Valence:" + " " + songfeatures[i].valence, 620, 460);// DRAW CIRCLES??
    text("  Danceability:" + " " + songfeatures[i].danceability, 620, 480);
    text("  Acousticness:" + " " + songfeatures[i].acousticness, 620, 500);
    text("  Liveness:" + " " + songfeatures[i].liveness, 620, 520);
    text("  Energy:" + " " + songfeatures[i].energy, 620, 540);
  }
//}*/
