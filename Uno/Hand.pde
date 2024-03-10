class Hand {
  ArrayList<Card> hand;
  int posx = 0;

  Hand() {
    hand = new ArrayList<Card>();
  }



  void drawCard(){
    Card temp = d1.deck.get(0);
    d1.deck.remove(0);
    hand.add(temp);
  }

  void playCard(int x){
    Card temp = hand.get(x);
    hand.remove(x);
    playedCards.add(temp);
  }

  void displayCards() {
    for (int x =0; x<hand.size(); x++) {
      if (mouseX>950 && mouseY>700) {
        posx--;
      }
      if (mouseX<50 && mouseY>700) {
        posx++;
      }
      hand.get(x).display(x*130+posx, 700);
    }
  }
}
