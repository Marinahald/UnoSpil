class Button {
  int xPos;
  int xSize;
  int yPos;
  int ySize;
  String bTxt;
  String type;


  Button(int xP, int xS, int yP, int yS, String bT, String fT) {
    xPos = xP;
    xSize = xS;
    yPos = yP;
    ySize = yS;
    bTxt = bT;
    type = fT;
  }

  void show() {

    if (type == "uno") {
      textSize(50);
      fill(0);
      rect(815, 790, 170, 95);
      fill(255, 0, 0);
      rect(825, 800, 150, 75);
      fill(255, 255, 0);
      text("UNO", 850, 855);
    } else if (type == "cardDrawnByPlayer") {
      fill(0);
      rect(xPos, yPos, xSize, ySize, 25);
      fill(255, 0, 0);
      ellipse(415, 500, 120, 150);
      fill(255, 255, 0);
      textSize(50);
      text("UNO", 365, 510);
    } else if (bTxt == "changeColorRed" || bTxt == "changeColorBlue" || bTxt == "changeColorGreen" || bTxt == "changeColorYellow") {
      switch(bTxt) {
      case "changeColorRed":
        fill(215, 38, 0);
        break;

      case "changeColorBlue":
        fill(9, 86, 191);
        break;

      case "changeColorGreen":
        fill(55, 151, 17);
        break;

      case "changeColorYellow":
        fill(236, 212, 7);
        break;
      }
      rect(xPos, yPos, xSize, ySize);
    } else {
      //knapper i menuen
      stroke(255, 255, 0);
      fill(255, 0, 0);
      rect(xPos, yPos, xSize, ySize);
      fill(255, 245, 0);
      textSize(30);
      text(bTxt, xPos+((xSize/2)-(textWidth(bTxt)/2)), yPos+((ySize/2)+5));

    }
  }

  void press() {
    if (mouseX>xPos && mouseX<xPos+xSize && mouseY>yPos && mouseY<yPos+ySize) {
      method(type);
    }
  }
}
