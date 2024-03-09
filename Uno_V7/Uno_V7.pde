Button b1; //<>//
Button b2;
Button b3;
Button b4;
Button b5;
Button unoHitB;
Button playB;
Button drawCardB;
Button chooseColorRed;
Button chooseColorBlue;
Button chooseColorGreen;
Button chooseColorYellow;
Button quit;
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
boolean gameStarted = false;
boolean botCardPlayed = false;
String[] colors = {"red", "blue", "green", "yellow"};
boolean gameRunning = false;


void setup() {
  size(1000, 1000);
  b1 = new Button(80, 500, 150, 60, "UNO", "uno");
  b2 = new Button(250, 500, 500, 60, "New game", "play");
  b3 = new Button(250, 500, 600, 60, "Rules", "rules" );
  b4 = new Button(250, 500, 700, 60, "Settings", "ind");
  b5 = new Button(900, 100, 80, 80, "", "mknap");
  unoHitB = new Button(815, 170, 600, 95, "UNO", "uno");
  drawCardB = new Button(350, 130, 400, 200, "Draw", "cardDrawnByPlayer");
  chooseColorRed = new Button(300, 100, 300, 100, "", "changeColorRed");
  chooseColorBlue = new Button(400, 100, 300, 100, "", "changeColorBlue");
  chooseColorGreen = new Button(300, 100, 400, 100, "", "changeColorGreen");
  chooseColorYellow = new Button(400, 100, 400, 100, "", "changeColorYellow");
  quit = new Button(250, 500, 800, 60, "Quit", "ud");
  l1 = new Logo(300, 80, 400, 400);
  newgame();
  
}

void newgame(){
 
  d1 = new Deck();
  initialCardDraw();
  human = new Player();
  bot = new Player();
  players = new Player[]{human, bot};
  playerTracker = 0;
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

    b5.show();


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
    displayBotHand();
    botBehaviour();

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
    exit();
    break;
  case 'r':
    background(255);
    textSize(100);
    text("Rules", (width/2)-(textWidth("Rules")/2), 100);
    b5.show();
    break;
  case 'i':
    background(255);
    textSize(100);
    text("Settings", (width/2)-(textWidth("Settings")/2), 100);
    b5.show();
    break;
  default:


    background(255);
    b2.show();
    b3.show();
    b4.show();
    l1.tegnLogo();
    quit.show();
    break;
  }
}


void mousePressed() {
  b1.press();
  if (!gameRunning) {
    b2.press();
    b3.press();
    b4.press();
    quit.press();
  }
  b5.press();
  d1.deckShuffle();
  if (gameRunning) {
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
  gameRunning = true;
}
void rules() {
  menu = 'r';
}
void ind() {
  menu = 'i';
}
void mknap() {
  menu = 'm';
  gameRunning = false;
  newgame();
}

void ud(){
  menu = 'q';
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

void botBehaviour() {
  if (players[playerTracker%2] == bot) {
    for (Card c : bot.h1.hand) {
      c.pressed();
      if (match) {
        match = false;
        botCardPlayed = true;
        break;
      }
    }
    if(!match){
      botCardPlayed = false;
    }
    if (!botCardPlayed) {
      cardDrawnByPlayer();
      bot.h1.hand.get(bot.h1.hand.size()-1).pressed();
    }
  }
}

void displayBotHand(){
  rect((width/2)-65, 120, 130, 200, 25);
  fill(0);
  text(bot.h1.hand.size()+"", ((width/2)-65)+((130/2)-(textWidth(bot.h1.hand.size()+"")/2)), 120+((200/2))+10);
}
