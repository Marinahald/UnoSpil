class Card {
  String cColor;
  int type;
  int xSize = 130;
  int ySize = 200;
  int xPos;
  int yPos;
  String cardSymbol;

  Card(String cC, int t/*,int x,int y*/) {
    cColor = cC;
    type = t;
    /*xPos = x;
     yPos = y;*/
    switch(this.type) {
    case 69:
      //switch direction
      cardSymbol = "69";
      break;

    case 42:
      //colorswitch
      cardSymbol = "color";
      break;

    case 45:
      //Skip
      cardSymbol = "Ø";
      break;

    case 44:
      //+2
      cardSymbol = "+2";
      break;

    case 88:
      //+4
      cardSymbol = "+4";
      break;

    default:
      //normal cards
      cardSymbol = this.type+"";
      break;
    }
  }

  void display(int x, int y) {
    //displays the type aka number or special
    xPos = x;
    yPos = y;
    //choses the color of the card
    switch(this.cColor) {
    case "red":
      fill(215, 38, 0);
      break;

    case "blue":
      fill(9, 86, 191);
      break;

    case "green":
      fill(55, 151, 17);
      break;

    case "yellow":
      fill(236, 212, 7);
      break;

    default:
      fill(0);
      break;
    }

    //draws the card with the previous info
    rect(xPos, yPos, xSize, ySize, 25);
    fill(255);
    text(cardSymbol, xPos+((xSize/2)-(textWidth(cardSymbol)/2)), yPos+((ySize/2))+10);
  }

  void pressed() {
    if (players[playerTracker%2] == human) {
      if (mouseX>xPos && mouseX<xPos+xSize && mouseY>yPos && mouseY<yPos+ySize) {
        if (this.type == playedCards.get(playedCards.size()-1).type || this.cColor == playedCards.get(playedCards.size()-1).cColor || this.cColor == "black" || this.cColor == currentColor) {
          human.h1.playCard(human.h1.hand.indexOf(this));
          currentColor = playedCards.get(playedCards.size()-1).cColor;
          match = true;
          if (playReversed) {
            playerTracker--;
            if (playerTracker<0) {
              playerTracker*=(-1);
            }
          } else {
            playerTracker++;
          }
          switch(type) {
          case 69:
            println("Switch direction");
            playReversed = !playReversed;
            break;

          case 42:
            println("Colorswitch");
            gamePaused = true;
            colorSwitch = true;
            break;

          case 45:
            println("skip");
            if (playReversed) {
              playerTracker--;
              if (playerTracker<0) {
                playerTracker*=(-1);
              }
            } else {
              playerTracker++;
            }
            break;

          case 44:
            println("+2");
            break;

          case 88:
            println("+4");
            break;

          default:
            println("You made a mistake");
            break;
          }
        }
      }
    } else {
      if (this.type == playedCards.get(playedCards.size()-1).type || this.cColor == playedCards.get(playedCards.size()-1).cColor || this.cColor == "black" || this.cColor == currentColor) {
        bot.h1.playCard(bot.h1.hand.indexOf(this));
        match = true;
        if (playReversed) {
          playerTracker--;
          if (playerTracker<0) {
            playerTracker*=(-1);
          }
        } else {
          playerTracker++;
        }
        switch(type) {
        case 69:
          println("Switch direction");
          playReversed = !playReversed;
          break;

        case 42:
          println("Colorswitch");
          currentColor = colors[int(random(0, 3))];
          break;

        case 45:
          println("skip");
          if (playReversed) {
            playerTracker--;
            if (playerTracker<0) {
              playerTracker*=(-1);
            }
          } else {
            playerTracker++;
          }
          break;

        case 44:
          println("+2");
          break;

        case 88:
          println("+4");
          break;

        default:
          println("You made a mistake");
          break;
        }
      }
    }
  }
}
