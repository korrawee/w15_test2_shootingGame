int amount = int(random(20,30));

Zombie[] zombies = new Zombie[amount];
Shooter shooter = new Shooter();
Bullet bullet = new Bullet();

//====================================================
void setup()
{
  size(900,900);
  for(int i = 0 ; i < amount; i++)
  {
   zombies[i] = new Zombie(); 
  }
}

//====================================================
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
  
  if(keyPressed){
    if(key == ' '){
      bullet.shoot(shooter.getX(), shooter.getY());
    }
    
  }
}
//====================================================
class Shooter{
  float px = 30; //player
  float py = 30; //player

  void player(){  //draw player
    stroke(0);
    fill(255);
    ellipse(px,py,50,50); 
    fill(0);
    strokeWeight(10);
    line(px+25, py, px+50, py);
    
  }
  
  float getX(){
    return px; 
  }
  
  float getY(){
    return py;  
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

//====================================================
class Bullet{
  int state;
  float x = 0;
  float y = 0;
  
	Bullet(){
    state = 0; // state hide by default
	}

  void shoot(float tmpX, float tmpY){
    x += tmpX + 50;
    y = tmpY;
    noStroke();
    fill(#FF1493); //pink color
    ellipse(x, y, 10, 10);
    if(x < width){
      x += 1;
    }else{
      x = tmpX; 
    }
  }
  
}

//====================================================
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
