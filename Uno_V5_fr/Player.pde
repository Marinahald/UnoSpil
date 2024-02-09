class Player{
  Hand h1;
 
  
  Player(){
    h1 = new Hand();
    for(int cards = 0; cards<7; cards++){
      h1.drawCard();
    }
  }
  /*
  void AI()
    {
     for(int x=0; x>(bot.h1.size()) ; x++)
       {
         if(h1.get(x).type == playedCards.get(playedCards.size()-1).type || h1.get(x).cColor == playedCards.get(playedCards.size()-1).cColor || h1.get(x).cColor == "black" || h1.get(x).cColor == currentColor)
       h1.playcard(x);
     }
      
    }
  
  
  */
}
