int count=20;//amount of boxes
float aX,aY,hX,hY;//location for item box
float[] x=new float[count];//location of box
float[] y=new float[count];
float[] r=new float[count];
float[] s=new float[count];//speed of box
float ox1;//calculate location of the eyes
float oy1;
float ox2;
float oy2;

Player player1;
Sky stars = new Sky();
//PImage head;


void setup() {
  size(900, 650);
  player1=new Player(100, 100);
  stars.setup();
  //head = loadImage( "up.jpg");
  smooth();
}

int life=3;
int score=0;
int counter=0;
int imgSaveNum=1;

void keyPressed()
{
  println("some key was pressed");
  if (key=='s'&& counter == 2)
  {
    saveFrame("animFrame"+imgSaveNum+".jpg");
    imgSaveNum++;
  }
  if (key==' ')
  {
    if (counter==0)
    {
      counter= 1;
    } else if (counter==2)
    {
      counter=0;
    } else
    {
      counter=0;
    }
  }
}
void draw() {
  if (counter==0)
  {
    background(0);
    fill(255);
    text("INSTRUCTIONS", 400, 370);
    if (dist(mouseX, mouseY,400, 370)<70)
    {
      fill(255);
      text("Welcom!!Press Space to start or quit game", 360, 450);
      text("A and D controls move left and right", 360, 470);
      text("Red box gives u health,gray box gives you ammo", 360, 490);
    }
    ellipse(mouseX, mouseY, 40, 40);
    for (int i=0; i<count; i++) {
      x[i]=random(0, width-5);
      y[i]=random(-1000, 0);
      r[i]=random(50, 60);
      s[i]=random(1, 2);
    }
    life=3;
    score=0;
    player1.x=width/2;
    float r1 = dist(mouseX, mouseY, width/2-40, height/2);
    float si1 = (mouseX-(width/2-40))/r1;
    float co1 = (mouseY-height/2)/r1;
    float r2 = dist(mouseX, mouseY, width/2+40, height/2);
    float si2 = (mouseX-(width/2+40))/r2;
    float co2 = (mouseY-height/2)/r2;
    if (abs(r1)<20) {
      ox1 = mouseX;
      oy1 = mouseY;
    } else {
      ox1 = width/2+20*si1-40;
      oy1 = height/2+20*co1;
    }
    if (abs(r2)<20) {
      ox2 = mouseX;
      oy2 = mouseY;
    } else {
      ox2 = width/2+20*si2+40;
      oy2 = height/2+20*co2;
    }
    fill(255);
    ellipse(width/2-40, height/2, 60, 60);
    ellipse(width/2+40, height/2, 60, 60);
    fill(0);
    ellipse(ox1, oy1, 20, 20);
    ellipse(ox2, oy2, 20, 20);
    hX=random(30,width-10);
    hY=random(-500,0);
    aX=random(30,height-10);
    aY=random(-1000,0);
    return;
  }
  

  if (counter==2)
  {
    background(0);
    text("Game Over", 350, 300);
    text("Press Space to try again", 350, 330);
    text("You final score is " + score, 350, 350);
    text("Press S to take a screenshot and compete with your friend:)", 350, 370);
    for (int i=0; i<count; i++) {
      x[i]=random(0, width-5);
      y[i]=random(-1000, 0);
      r[i]=random(50, 60);
      s[i]=random(1, 2);
    }
    hX=random(0,width-10);
    hY=random(-500,0);
    aX=random(30,height-10);
    aY=random(-1000,0);
    life=3;
    player1.x=width/2;
    return;
  } else {
    background(0);
    player1.move();
    player1.draw();
    stars.move(); 
    stars.display(); 
    text("Life:" + life, 30, 30);
    text("Score:"+ score, 30, 60);
    text("Press Space to back to start", 30, 90);
    for (int i=0; i<count; i++) {
      if (y[i]>height) {
        x[i]=random(0, width-5);
        y[i]=-2;
        s[i]+=0.3;
        score++;
      }
      if (dist(player1.x+6, 0, x[i], 0)<60&&dist(0, player1.y, 0, y[i])<60) {
        y[i]=-5;
        x[i]=random(x[i]+50, x[i]-50);//box drop again
        life--;
        s[i]++;
        if (life==0)
        {
          counter=2;
        }
      }
      y[i]+=s[i];
      ellipseMode (CENTER); 
      rectMode (CENTER); 
      noStroke(); 
      fill (45); 
      rect (x[i], y[i]-15, 65, 6); 
      rect (x[i], y[i]-15, 85, 5); 
      arc (x[i], y[i]-8, 16, 35, PI, PI*2); 
      ellipse (x[i], y[i]-10, 35, 16); 
      fill (190, 100, 50); 
      ellipse (x[i]-26, y[i]-15, 13, 13); 
      ellipse (x[i]+26, y[i]-15, 13, 13); 
      fill (180, 73, 50); 
      ellipse (x[i]+26, y[i]-15, 5, 5); 
      ellipse (x[i]-26, y[i]-15, 5, 5);
      
      fill(255);
      stroke(255,0,0);
      rect(aX,aY,40,40);
      fill(255,0,0);
      rect(aX+12,aY-13,16,13);
      rect(aX-12,aY-13,16,13);
      rect(aX-12,aY+13,16,13);
      rect(aX+12,aY+13,16,13);

      aY+=0.3;
      if (aY>height) {
        aX=random(60, width-5);
        aY=random(-500,0);
      }
      if (dist(player1.x+6, 0, aX, 0)<60&&dist(0, player1.y, 0, aY)<60) {
        aY=random(-700,0);
        aX=random(x[i]+50, x[i]-50);
        life++;
        score+=10;
      }

      
    }
  }
}

