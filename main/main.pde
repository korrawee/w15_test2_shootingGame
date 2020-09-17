int amount = int(random(20,30));
float px = 0; //testplayer
float py = 0; //testplayer
Zombie[] zombies = new Zombie[amount];
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
 fill(255); // testplayer
 ellipse(30+px,30+py,50,50); // testplayer
 
  for(int i = 0 ; i < amount; i++)
  {
   zombies[i].spawn();
   zombies[i].move();
  }
}
class Shooter{

	Shooter(){


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
    if( x > px)
    {
      x -= 0.5;
    }
    else if (x < px)
    {
      x += 0.5;
    }
    if( y > py)
    {
      y -= 0.5;
    }
    else if (y < py)
    {
      y += 0.5;
    }
  }
}
// testplayer
void keyPressed() 
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
