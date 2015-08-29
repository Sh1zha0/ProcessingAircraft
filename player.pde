class Player
{

  color colour;

  Player(float x, float y, float w, float h)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    colour=color(255);
  }
  Player(float x,float y)
  {
    
    x=450;
    y=580;
    w=50;
    h=50;
    colour = color(0);
  }
  
  float x=450, y=630;
  float w, h;

  void draw()
  {
    background(0);
    fill(255);
    ellipseMode (CENTER); 
    rectMode (CENTER); 
    stroke (255); 
    strokeWeight (1); 
    fill (45, 37, 100); 
    rect (x, y-15, 65, 6); 
    rect (x, y-15, 85, 5); 
    arc (x, y-8, 16, 35, PI, PI*2); 
    rect (x+20, y-5, 20, 16); 
    rect (x-20, y-5, 20, 16); 
    fill (0, 80, 192); 
    ellipse (x-26, y-15, 13, 13); 
    ellipse (x+26, y-15, 13, 13); 
    fill (99, 173, 242);
    rect(x+26,y-10,8,25 );
    rect(x-26,y-10,8,25);
    ellipse (x+26, y-15, 5, 5); 
    ellipse (x-26, y-15, 5, 5);
    
  }

  void move()
  {
    if (keyPressed)
    {
      switch(key)
       {
      /*case'w':
        y=y-5;
        break;
      case's':
        y=y+5;
        break;*/
      case'a':
      if(x>30){
        x=x-5;
        break;
      }
      case'd':
      if(x<width-30){
        x=x+5;
        break;
      }
      }
    }
  }
}

