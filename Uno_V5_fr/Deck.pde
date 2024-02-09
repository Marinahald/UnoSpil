class Deck{
  ArrayList<Card> deck;
  
  
  Deck(){
    deck = new ArrayList<Card>();
    String[] colors = {"red", "green", "blue", "yellow"};
    int[] type = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 69, 45, 44};
    int[] wildcard = {42, 88};
    
    
    for(String cCol : colors){
      for(int x = 0; x<2; x++){
      for(int cT : type){
        if(x>=1&&cT==0){
          println("");
        } else{
          Card card = new Card(cCol, cT/*,0,0*/);
        deck.add(card);
        }
      }
    }
  }
  for(int x = 0; x<4; x++){
    for(int wC : wildcard){
      Card card = new Card("black", wC);
        deck.add(card);
    }
  }
  deckShuffle();
  }
  
  
   void deckShuffle() {
    for (int i = deck.size() - 1; i > 0; i--) {
      int j = int(random(i + 1));
      Card temp = deck.get(i);
      deck.set(i, deck.get(j));
      deck.set(j, temp);
    }
  }
  
  
}
