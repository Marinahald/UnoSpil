class Kort {
  int xPos;
  int wid;
  int yPos;
  int heig;
  PImage Unologo;


  Kort(int xP, int w, int yP, int h) {
    Unologo = loadImage("UNO_Logo.png");
    xPos = xP;
    wid = w;
    yPos = yP;
    heig = h;
  }
  
  void tegnKort(){
   image(Unologo,xPos, wid, yPos, heig); 
    
  }
}
