int amount = int(random(20,30));

Zombie[] zombies = new Zombie[amount];
Shooter shooter = new Shooter();
void setup()
{
  size(900,900);
  for(int i = 0 ; i < amount; i++)
  {
   zombies[i] = new Zombie(); 
  }
}
void draw()
{
 background(#FFFFFF);
 shooter.player();
 shooter.keyPressed();
  for(int i = 0 ; i < amount; i++)
  {
   zombies[i].spawn();
   zombies[i].move();
  }
}
class Shooter{
  float px = 0; //player
  float py = 0; //player

  void player(){  //draw player
    fill(255); 
    ellipse(30+px,30+py,50,50); 
    fill(0);
    strokeWeight(10);
    line(55+px,30+py,90+px,30+py);
    
  }
 
  void keyPressed(){           //Shooter move
  if (keyPressed == true)
  {
    if(key == CODED)
   {
     if(keyCode == UP)
     {
       py -= 10; 
     }
     else if(keyCode == DOWN)
     {
      py +=  10; 
     }
     if(keyCode == LEFT)
     {
       px -= 10; 
     }
     else if(keyCode == RIGHT)
     {
      px +=  10; 
     }
   }
  }
 }
}


class Bullet{
  protected int state;
  protected int x;
  protected int y;
  
	Bullet(){
    state = 0; // state hide by default
	}
}

class Zombie
{
  float x = random(900,1500);
  float y = random(0,1000);
  void spawn()
  {
    fill(#556B2F);
    ellipse(x,y,50,50);
  }
   void move()
  {
    if( x > shooter.px)
    {
      x -= 0.5;
    }
    else if (x < shooter.px)
    {
      x += 0.5;
    }
    if( y > shooter.py)
    {
      y -= 0.5;
    }
    else if (y < shooter.py)
    {
      y += 0.5;
    }
  }
}
