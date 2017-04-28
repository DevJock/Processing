/*
   HOLIDAY LIGHTS V1(a)
   PROGRAMMING AND PROGRAM DESIGN BY CHIRAAG BANGERA 
   CONTACT ME @ chiraagxbl@live.com
   
   SIMPLE APP I MADE IN MY FREE TIME USING PROCESSING AND JAVA PROGRAMMING LANGUAGE.
   
   COPYRIGHT 2012-2013 CHIRAAG BANGERA.  
   
*/



int r=0,g=0,b=0;


void setup()
{
  PFont myFont = createFont(PFont.list()[2], 37);
  textFont(myFont);
  size(800,800);
}

int t=0;

void keyPressed()
{
  exit();
}


void draw()
{
  try
  {
  background(r,g,b);
  text("HOLIDAY LIGHTS v1.0.0.0",50,500);
  text("PRESS ANY KEY TO QUIT AT ANY TIME",50,300);
  if(r==-1&&g==-1&&b==-1)
  t=0;
  else if(r==256&&g==256&&b==256)
  t=1;
  if(t==1)
  {
  if(b>=0)
  b--;
  if(g>=0&&b==-1)
  g--;
  if(r>=0&&g==-1&&b==-1)
  {
    r--;
    if(r==-1)
    Thread.sleep(1500);
  }
  }
  else
  {
  if(r<=255)
  r++;
  if(r==256&&g<=255)
  g++;
  if(r==256&&g==256&&b<=255)
  {
    b++;
    if(b==256)
    Thread.sleep(1500);
  }
  }
  }
  catch(Exception d)
  {
    println("ERROR : "+d.toString());
  }
}

