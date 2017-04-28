import processing.serial.*;


int screen_x=1920,screen_y=1080;
boolean reset = true;
boolean clickable = false;
int userxx[]=new int[5];
int userxy[]=new int[5];
int userox[]=new int[5];
int useroy[]=new int[5];
int count=0;
int i=0;
int valX = 122/2/2;
int valY = -122/2/2;
int spacing = 150;
int spacingGY = 150;
int spacingGX = 550;
boolean screenSet = true;
boolean gameOver = false;
int ix=0,io=0;
boolean debug =true;

void printX(int x, int y)
{
  fill(0,255,0);
  textSize(122);
  text("X",x,y);
  userxx[ix]=x;
  userxy[ix]=y;
  ix++;
  if(debug)
  {
    textSize(22);
    fill(0,255,0);
    text("X: "+x+" Y: "+y,x-50,y+20);
  }
}

void printO(int x,int y)
{
  fill(255,0,0);
  textSize(122);
  text("O",x,y);
  userox[io]=x;
  useroy[io]=y;
  io++;
    if(debug)
  {
    textSize(22);
    fill(255,0,0);
    text("X: "+x+" Y: "+y,x-40,y+20);
  }
}

void setup()
{
  size(screen_x,screen_y);
  smooth();
  background(0);
}

/*
void draw_xy()
{
  stroke(255);
  line(screen_x/1.9,screen_y/8,(screen_x/1.9),(screen_y/8+500));
  line(screen_x/3.5,screen_y/8,(screen_x/3.5),(screen_y/8+500));
  line(screen_x/8,screen_y/3.0,(screen_x/8+500),(screen_y/3.0));
  line(screen_x/8,screen_y/1.5,(screen_x/8+500),(screen_y/1.5));
  reset = false;
}
*/

void draw_xy()
{
  int xx = screen_x;
  int yy = screen_y;
  stroke(255);
  line(xx/2 - spacing , 0 + spacingGY, xx/2 - spacing , yy- spacingGY);
  line(xx/2 + spacing , 0 + spacingGY, xx/2 + spacing , yy - spacingGY);
  line(0 + spacingGX, yy/2 - spacing , xx - spacingGX, yy/2 - spacing);
  line(0 + spacingGX, yy/2 + spacing , xx - spacingGX, yy/2 + spacing);
  
  reset = false;
}

void keyPressed() 
{
   if(gameOver)
   {
    if (keyCode == ENTER) 
    {
      reset = true;
      println("Game Reset!");
      gameOver=false;
    } 
   }
    
   if(!screenSet)
   {
     int res = key - '0';
     switch(res)
     {
       case 1:
       {
         screenSet = true;
         reset =true;
         screen_x = 640;
         screen_y = 480;
         break;
       }
       
       
       case 2:
       {
         screenSet = true;
         reset =true;
         screen_x = 800;
         screen_y = 600;
         break;
       }
       
       
       case 3:
       {
         screenSet = true;
         reset =true;
         screen_x = 1024;
         screen_y = 768;
         break;
       }
       
       
       case 4:
       {
         screenSet = true;
         reset =true;
         screen_x = 1280;
         screen_y = 720;
         break;
       }
       
       
       case 5:
       {
         screenSet = true;
         reset =true;
         screen_x = 1920;
         screen_y = 1080;
         break;
       }
       
       
       case 6:
       {
         screenSet = true;
         reset =true;
         screen_x = 2560;
         screen_y = 1440;
         break;
       }
       
       
       case 7:
       {
         screenSet = true;
         reset =true;
         screen_x = 3840;
         screen_y = 2160;
         break;
       }
     }
       
     println("Set Screen Res:\n W: "+screen_x+" H: "+screen_y);
   }
  
  
}

void mouseClicked()
{
   //textSize(22);
  int x=mouseX;
  int y=mouseY;
  x=x-valX;
  y=y-valY;
  if(clickable)
  {
  clickable=false;  
  printX(x,y);
  }
  else
  {
  clickable=true;
  printO(x,y);
  }
  count++;
  
}
  

  
  
void setScreen()
{
  background(0);
  textSize(50);
  fill(255);
  text("Set Screen Resolution",50,90);
  textSize(40);
  text("1. 640x480",100,150);
  text("2. 800x600",100,200);
  text("3. 1024x768",100,250);
  text("4. 1280x720  [HD]",100,300);
  text("5. 1920x1080 [HD]",100,350);
  text("6. 2560x1440 [2K]",100,400);
  text("7. 3840x2160 [4K]",100,450);
  
}



void draw()
{
  if(!screenSet)
  {
    setScreen();
  }
  
  if(reset)
  {
    resize(screen_x,screen_y);
    count=0;
    background(0);
    draw_xy();
    clickable=true;
    println("Game Start!");
    ix=0;
    io=0;
  }
  
if(count>=9)
{
  gameOver=true;
  background(0);
  textSize(120);
  fill(255,0,0);
  text("Game Over",screen_x/2-(300+10),screen_y/2-10);
    textSize(60);
  fill(122,122,122);
  text("Click return to Play Again",screen_x/2-(360+10),screen_y/2+60);
}

  
}
