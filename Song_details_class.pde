class Songdetails {
  int spotifyranking ;  
  String artists  ;
  String name  ;
  String genre  ;
  String keysignature ;
  int tempo  ;
  int mode  ;
  float valence; 
  float danceability  ;
  float acousticness ; 
  float liveness  ;
  float energy  ;
  int duration_ms  ;
  float speechiness;

  Songdetails(int sr, String a, String n, String g, String ks, int t, int m, float v, float d, float ac, float l, float e, int dms, float sp) {
    spotifyranking = sr;  
    artists = a;
    name =n ;
    genre = g ;
    keysignature = ks;
    tempo = t;
    mode = m  ;
    valence = v; 
    danceability = d ;
    acousticness = ac ; 
    liveness = l  ;
    energy = e  ;
    duration_ms = dms  ;
    speechiness = sp;
  }
}
