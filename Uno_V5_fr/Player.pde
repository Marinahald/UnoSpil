class Player{
  Hand h1;
  
  Player(){
    h1 = new Hand();
    for(int cards = 0; cards<7; cards++){
      h1.drawCard();
    }
  }
  
  
  
}
