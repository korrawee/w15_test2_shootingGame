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
   zombies[i] = new Zombie(random(900,1500),random(0,900),50,i,zombies); 
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
   zombies[i].collision();
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
  }
  void visibility()
  {
    if( bullet.getX() <= this.right()  && bullet.getX() >= this.left() && bullet.getY() <= this.buttom() && bullet.getY() >= this.top() )
    {
      state = 1;
    }
  }
  
 void collision()
 {
    for (int i = 1; i < amount; i++)
    {
     float dx = others[i].x - x;
     float dy = others[i].y - y;
     float distance = sqrt(dx*dx + dy*dy);
     float minDist = others[i].s/2+5 + s/2+5;
     if( distance < minDist)
     {
        float angle = atan2(dy, dx);
        float tempX = x + cos(angle) * minDist;
        float tempY = y + sin(angle) * minDist;
        float ax = (tempX - others[i].x) *0.05 ;
        float ay = (tempY - others[i].y) *0.05;
        speedX -= ax;
        speedY -= ay;
        others[i].speedX += ax;
        others[i].speedY += ay;
     }
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
