Button b1; //<>//
Button b2;
Button b3;
Button b4;
Button unoHitB;
Button playB;
Button drawCardB;
Button chooseColorRed;
Button chooseColorBlue;
Button chooseColorGreen;
Button chooseColorYellow;
Deck d1;
Logo l1;


boolean unoHit;
char menu;
Player human;
Player bot;
Player[] players;
int[] specialCards = {69, 42, 45, 44, 88};
int playerTracker = 0;
boolean playReversed = false;
boolean gamePaused = false;
ArrayList<Card> playedCards = new ArrayList<Card>();
boolean match = false;
boolean colorSwitch = false;
String currentColor;


void setup() {
  size(1000, 1000);
  b1 = new Button(80, 500, 150, 60, "UNO", "uno");
  b2 = new Button(250, 500, 500, 60, "New game", "play");
  b3 = new Button(250, 500, 600, 60, "Rules", "rules" );
  b4 = new Button(250, 500, 700, 60, "Settings", "ind");
  unoHitB = new Button(815, 170, 600, 95, "UNO", "uno");
  drawCardB = new Button(350, 130, 400, 200, "Draw", "cardDrawnByPlayer");
  chooseColorRed = new Button(300, 100, 300, 100, "", "changeColorRed");
  chooseColorBlue = new Button(400, 100, 300, 100, "", "changeColorBlue");
  chooseColorGreen = new Button(300, 100, 400, 100, "", "changeColorGreen");
  chooseColorYellow = new Button(400, 100, 400, 100, "", "changeColorYellow");
  d1 = new Deck();
  initialCardDraw();
  human = new Player();
  bot = new Player();
  players = new Player[]{human, bot};
  l1 = new Logo(300, 80, 400, 400);
}


void draw() {

  //visuals
  switch(menu) {
  case 'p':
    background(255);
    //overskrift
    fill(0);
    textSize(100);
    text("UNO", 400, 100);

    b1.show();
    //kort
    rect(350, 400, 130, 200, 25);
    fill(255, 0, 0);
    ellipse(415, 500, 120, 150);
    fill(255, 255, 0);
    textSize(50);
    text("UNO", 365, 510);
    stroke(0);
    fill(255);
    rect(550, 400, 130, 200, 25);

    //træk kort knap
    drawCardB.show();
    //spillede kort bunke
    stroke(0);
    fill(255);
    rect(550, 400, 130, 200, 25);



    //menuknap
    fill(160, 160, 160);
    rect(900, 100, 80, 80, 20);
    fill(0);
    rect(920, 120, 40, 5);
    rect(920, 137.5, 40, 5);
    rect(920, 155, 40, 5);


    //gameplay
    if (human.h1.hand.size() == 1) {
      unoHitB.show();
    }
    human.h1.displayCards();

    for (Card c : playedCards) {
      int xPile = 550;
      int yPile = 400;
      c.display(xPile, yPile);
    }

    if (d1.deck.size()<1) {
      for (int x = 0; x<playedCards.size(); x++) {
        Card temp = playedCards.get(0);
        playedCards.remove(0);
        d1.deck.add(temp);
      }
      d1.deckShuffle();
      initialCardDraw();
    }

    if (gamePaused) {
      //visuals
      if (colorSwitch) {
        chooseColorRed.show();
        chooseColorBlue.show();
        chooseColorGreen.show();
        chooseColorYellow.show();
      }

      //gameplay
    }

    break;

  case 'q':
    println("Quit");
    break;
  case 'r':
    background(255);
    textSize(100);
    text("Rules", (width/2)-(textWidth("Rules")/2), 100);
    break;
  case 'i':
    background(255);
    textSize(100);
    text("Settings", (width/2)-(textWidth("Settings")/2), 100);
    break;
  default:


    background(255);
    b2.show();
    b3.show();
    b4.show();
    l1.tegnLogo();

    break;
  }
}


void mousePressed() {
  b1.press();
  b2.press();
  b3.press();
  b4.press();
  d1.deckShuffle();
  if (players[playerTracker%2] == human) {
    unoHitB.press();
    drawCardB.press();
    for (Card c : human.h1.hand) {
      c.pressed();
      if (match) {
        match=false;
        break;
      }
    }
  }
  if (colorSwitch) {
    chooseColorRed.press();
    chooseColorBlue.press();
    chooseColorGreen.press();
    chooseColorYellow.press();
  }
}

void uno() {
  unoHit = true;
}

void play() {
  menu = 'p';
  d1.deckShuffle();
}
void rules() {
  menu = 'r';
}
void ind() {
  menu = 'i';
}

void cardDrawnByPlayer() {
  players[playerTracker%2].h1.drawCard();
}

void initialCardDraw()
{
  Card temp = d1.deck.get(0);
  d1.deck.remove(0);
  playedCards.add(temp);
}

void changeColorRed() {
  currentColor = "red";
  colorSwitch = false;
  gamePaused = false;
}

void changeColorBlue() {
  currentColor = "blue";
  colorSwitch = false;
  gamePaused = false;
}

void changeColorGreen() {
  currentColor = "green";
  colorSwitch = false;
  gamePaused = false;
}

void changeColorYellow() {
  currentColor = "yellow";
  colorSwitch = false;
  gamePaused = false;
}
