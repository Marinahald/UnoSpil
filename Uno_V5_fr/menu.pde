class Logo {
  int xPos;
  int wid;
  int yPos;
  int heig;
  PImage Unologo;


  Logo(int xP, int w, int yP, int h) {
    Unologo = loadImage("UNO_Logo.png");
    xPos = xP;
    wid = w;
    yPos = yP;
    heig = h;
  }
  
  void tegnLogo(){
   image(Unologo,xPos, wid, yPos, heig); 
    
  }
}
