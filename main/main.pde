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
//------------------------------------------------------------------------
    // real random => first random (900,1500) second (0,900)
    //random now test
   zombies[i] = new Zombie(random(500,900),random(500,900),50,i,zombies); 
//-------------------------------------------------------------------------
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
   zombies[i].visibility();
  }
  
  if(keyPressed)
  {
   if(key == ' ')
   {
    bullet.shoot(shooter.getX(), shooter.getY());
   } 
  }
}
//====================================================
class Shooter
{
  float px = 30; //player
  float py = 30; //player

  void player()
  {  //draw player
    stroke(0);
    fill(255);
    ellipse(px,py,50,50); 
    fill(0);
    strokeWeight(10);
    line(px+25, py, px+50, py);   
  }
  
  float getX()
  {
    return px; 
  }
  
  float getY()
  {
    return py;  
  }
 
  void keyPressed()
  {           //Shooter move
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
    if (px+25 > width) 
    {
     px = width - 30;
    }
    if (px-25 < 0) 
    {
     px = 30;
    }
    if (py+25 > height) 
    {
     py = height - 30;
    }
    if (py-25 < 0) 
    {
     py = 30;
    }
   }
  }
 }
}

//====================================================
class Bullet
{
  int state;
  float x = 0;
  float y = 0;
  
  Bullet()
  {
    state = 0; // state hide by default
  }

  void shoot(float tmpX, float tmpY)
  {
    x += tmpX + 50;
    y = tmpY;
    noStroke();
    fill(#FF1493); //pink color
    ellipse(x, y, 10, 10);
    if(x < width)
    {
      x += 1;
    }
    else
    {
      x = tmpX; 
    }
  }
  float getX()
  {
   return x; 
  }
  
  float getY()
  {
    return y; 
  }
}
//====================================================
class Zombie
{
  int state = 0;
  float x ;
  float y ;
  float s ;
  int id;
  float speedX;
  float speedY;
  Zombie[] others;
  
  Zombie(float xpos ,float ypos, float size,int idin,Zombie[] oin)
  {
    x = xpos;
    y = ypos;
    s = size;
    id = idin ;
    others = oin ;
  }
  
  void spawn()
  {
   if(state == 0)
   {
    fill(#556B2F);
    ellipse(x,y,s,s);
   }
  }
  void move()
  { 
   y = y + speedY;
   x = x + speedX;
   
   if( x > shooter.getX())
   {
     speedX = -0.5;
   }
   else if (x < shooter.getX())
   {
     speedX = 0.5;
   }
   if( y > shooter.getY())
   {
     speedY = -0.5;
   }
   else if (y < shooter.getY())
   {
     speedY = 0.5;
   }
     //collision not fix
//------------------------------------------------------------------------
    //for (int i = id + 1; i < amount; i++)
    //{
     //if(others[i].x+30 <= this.x || others[i].y+30 <= this.y )
     //{
       //speedX = 0;
       //speedY = 0;
     //}
    //}
//-------------------------------------------------------------------------
  }
  void visibility()
  {
    if( bullet.getX() <= this.right()  && bullet.getX() >= this.left() && bullet.getY() <= this.buttom() && bullet.getY() >= this.top() )
    {
      state = 1;
    }
  }
  
  float left()
  {
    return x - (s/2+5);
  }
  
  float right()
  {
    return x + (s/2+5);
  }
  
  float top()
  {
    return y - (s/2+5);
  }
  
  float buttom()
  {
    return y + (s/2+5);
  }
}
