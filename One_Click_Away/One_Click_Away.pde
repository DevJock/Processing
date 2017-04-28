/*  1 - CLICK AWAY®  v2

    Programmed and Developed By Chiraag Bangera
    
    CLICK THE BUTTON AS FAST AS YOU CAN BEFORE THE TIME RUNS OUT
    
    Initial Release
    
    No modification of Code allowed 
    
    VERSION : 1.0.0
    
    Contact me @ chiraagxbl@live.com
    
    © Chiraag Bangera 2012 - 2013

*/
String version = "1.0.0";
int h,w,sx=800,sy=600;
int secs = 15;
int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
color rectColor, baseColor;
color rectHighlight;
color currentColor;
color click;
boolean clickd;
boolean rectOver = false;
boolean active = false;
boolean gameOver = false ;
int setSec = 0;
int rtime = secs , clik=0;
float clikrt = 0.0,fclikrt=0.0;
String classAwrd = "null" ;

void setup()
{
  size(sx,sy);
  smooth();
  background(0);
  h=height;
  w=width;
  rectColor = color(180,180,180);
  rectHighlight = color(0,49,100);
  baseColor = color(102);
  click = color(51,101,234);
  currentColor = baseColor;
  rectX = width/2-rectSize+20;
  rectY = height/2-rectSize+200;
  ellipseMode(CENTER);
}

int sysSec,diffSec,dur=secs;
int Timer()
{
  sysSec = second();
  if(sysSec != setSec)
  {  
  dur--;
  setSec = sysSec; 
  }
  return(dur);
}

void finalClikRate()
{
  fclikrt = clik / 15.0 ;
}

void draw()
{
  background(0);
  update(mouseX, mouseY);
  fill(255,255,255);
  textSize(h*.02);
  text("APP BY CHIRAAG BANGERA",w-(w-10),h-5);
  text("VERSION :"+version,w-(w-10),10);
  textSize(h*.08);
  fill(255,0,0);
  text("1 - CLICK AWAY",(w/2)-(17*10),(h/2)-200);
  textSize(h*.045);
  fill(0,0,255);
  text("HIT THE BUTTON AS MUCH AS YOU CAN IN "+secs+" SECONDS",30,(h/2)-130); 
  if(rectOver) 
  {
    fill(rectHighlight);
  }
  else 
  {
    fill(rectColor);
  }
  if(clickd)
  {
    fill(click);
  }
  stroke(255);
  rect(rectX, rectY, rectSize+40, rectSize-20);
  if(clik == 0 && active == false)
  {
  textSize(h*.03);
  fill(255);
  text("GO !",(rectX+43),(rectY+40));
  } 
  if(!rectOver && active)
  {
  textSize(h*.03);
  fill(255);
  text("CLICK ME !",(rectX+23),(rectY+40));
  } 
  if(rectOver && active)
  {
  textSize(h*.03);
  fill(255);
  text("KEEP CLICKIN !",(rectX+2),(rectY+40));
  }
  if(active)
  rtime =Timer();
  if(rtime <= 0)
  {
    gameOver = true;
    active = false ;
  }
  textSize(h*.06);
  fill(200,200,200);
  text("REMAINING TIME: "+rtime,(w/2)-(18*10),h-320);
  text("TOTAL CLICK(S): "+clik,w/2-(18*10),h-240);
  if(gameOver == true && active ==false)
  {
    background(0);
    finalClikRate();
    classifier();
    fill(255,255,255);
    textSize(h*.02);
    text("APP BY CHIRAAG BANGERA",w-(w-10),h-5);
    text("VERSION :"+version,w-(w-10),10);
    fill(200,0,0);
    textSize(h*.06);
    text("STOP ! TIME'S UP ",100,100);
    fill(120,120,0);
    textSize(h*.04);
    text("YOU CLICKED THE BUTTON "+clik+" TIME(S)",100,170);
    text("YOUR FINAL CLICK RATE: "+fclikrt%1000,100,280);
    text("CLASS: " +classAwrd,100,390);
  }
}





void classifier()
{
 if(clik>155)
 classAwrd = "INSANE"; 
 else if(clik>120&&clik<155)
 classAwrd = "XTREME";
 else if(clik>90&&clik<120)
 classAwrd = "AWESOME";
else if(clik>60&&clik<90)
 classAwrd = "GOOD";
else
 classAwrd = "LAME"; 
}


void update(int x, int y) 
{
  if ( overRect(rectX, rectY, rectSize, rectSize) ) 
  {
    rectOver = true;    
  } else 
  {
    rectOver = false;
  }
}

void mousePressed() 
{
  if(active == false && rectOver)
  {
  active = true; 
  setSec = second();
  clik-=1;
  }
  if(rectOver && active == true)
  clik++;
  /*if(gameOver == true && rectOver)
  { 
   show = false; 
   reset = true;
   gameOver = false;
  }
  */
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width &&  mouseY >= y && mouseY <= y+height) 
  {
    return true;
  } else 
  {
    return false;
  }
}
