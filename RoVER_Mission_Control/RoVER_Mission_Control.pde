/*  RoVER Mission Control®

    Programmed and Developed By Chiraag Bangera
    
    No modification of Code allowed 
    
    Contact me @ chiraagxbl@live.com
    
    © Chiraag Bangera 2012 - 2013

*/
import processing.serial.*;


Serial port;
int chos_port = -1;
char in;
float RF ;
boolean GD = false;
int x=400,y=100;
float vcc=0,temp=0.0;
boolean ai= false,disable_keys = false;
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup()
{
  try
  {
  size(1280,800);
  PFont Font = createFont(PFont.list()[2], 20);
  textFont(Font);
  smooth();
  }
  catch(Exception z)
  {
    println(z);
  }
}

void createPort()
{
  port = new Serial(this,Serial.list()[10],9600);
  port.bufferUntil('\n');
}
void keyPressed()
{
  try
  {
    if(!disable_keys)
    {
  if(chos_port == -1)
  chos_port = key-48;
  else
  {
    in = key;
    if(in <'A' || in >'Z')
    println("ONLY UPPER CASE CHARACTERS ");
    else
    {
     //if(in=='Z')
    // toggleAI();
    switch(in) 
    {
      case 'W': port.write('W'); break;
      case 'S': port.write('S'); break;
      case 'A': port.write('A'); break;
      case 'D': port.write('D'); break;
      case 'L': port.write('L'); break;
      default :port.write('X');break;
    }
    }
    
  }
  }
  }
  catch(Exception k)
  {
  }
}


boolean lastswitch=false;
void toggleAI()
{
  if(!lastswitch)
  {
    ai=true;
    lastswitch = true ; 
  }
  else
  {
    ai=false;
    lastswitch = false;
    return;
  }
}
  

void serialEvent(Serial port)
{
  try
  {
  int index =0;
  String trf="" , tgd="" ,t="",tc="",vc="" ;    
  t=port.readStringUntil('\n');
  for(int i=0;i<t.length();i++)
  {
    char ch=t.charAt(i);                      //xxx,yyyy.z
    if(ch==',')                               //0123456789
    {
      trf=t.substring(index,i);
      index=i+1;
    }
    if(ch=='.')
    {
    tc=t.substring(index,i);
    index=i+1;
    }
    if(ch==':')
    {
    vc=t.substring(index,i);
    index=i+1;
    }
  }
  tgd=t.substring(index,t.length()-2);
  vcc=float(vc)/100.0;
  temp=float(tc)/10.0;
  GD=boolean(int(tgd));
  RF=float(trf);
}
catch(Exception se)
{
 println("ERROR OCCURED : "+se.toString()); 
} 

}

int count = 0;
int wtime=0;
void draw()
{
  startt:
   try
  {
  if(chos_port == -1)
  {
   wtime++;
    do
  {
  background(0,0,0);
  text("RoVER Mission Control ",x,y-25);
  text("CHOOSE A COM PORT ",x,y+25);
  clock();
  for(int l=0;l<Serial.list().length;l++)
  text(l+". "+Serial.list()[l],x,y+75+(l*25));
  if(wtime>=5000)
  graphics();
  }while(chos_port>0&&chos_port<Serial.list().length);
  count=1;
  }
  else
  {
  if(count==1)
  {
  createPort();
  count=0;
  }
  if(!ai)
  {
  background(0);
  clock();
  text("RoVER Mission Control ",x+100,y-25);
  text("               ^         ",x+50,y+50);
  text("               |         ",x+50,y+75);
  text("               W          ",x+50,y+100);
  text("       <-- A       D-->   ",x+50,y+125);
  text("               S        ",x+50,y+150);
  text("               |         ",x+50,y+175);
  text("               V        ",x+50,y+200);
  text("PRESS 'W' 'A' 'S' 'D' TO MOVE ROVER",x,y+250);
  text("PRESS 'L' TO TOGGLE LED(S) ON OR OFF \nAND PRESS Z TO TOGGLE A.I",x,y+275);
  text("RANGE FINDER: "+RF,x,y+450);
  text("GROUND DETECT: "+GD,x+275,y+450);
  text("SELECTED PORT: "+Serial.list()[chos_port],x,y+335);
  text("POWER SUPPLY: "+vcc+" V",x,y+400);
  text("TEMPERATURE: "+temp+" C",x+300,y+400); 
  text("Robot and App By : Chiraag Bangera",x+50,y+500);
  }
  else if(ai)
  { 
  background(0);
  clock();
  AI();
  text("RoVER Mission Control ",x+100,y-25);
  text("A.I MODE ACTIVATED",x,y+250);
  text("ROBOT IS CONTROLLED BY THE HOST COMPUTER.\nPRESS Z AGAIN TO DEACTIVATE A.I",x,y+275);
  text("RANGE FINDER: "+RF,x,y+450);
  text("GROUND DETECT: "+GD,x+275,y+450);
  text("SELECTED PORT: "+Serial.list()[chos_port],x,y+335);
  text("POWER SUPPLY: "+vcc+" V",x,y+400);
  text("TEMPERATURE: "+temp+" C",x+300,y+400); 
  text("Robot and App By : Chiraag Bangera",x+50,y+500);
  }
  }
  }

  catch(Exception e)
  {
    for(int l=0;l<e.toString().length();l++)
    text("ERROR OCCURED : "+e.toString(),x-200,y+510+(l*25));
  }
}


void AI()
{
  try
  {
 
  if(GD == true)
    {
      if(RF < 400)
      {
        port.write('W');
      }
      else
      {
        port.write('S');
        delay(1250);
        port.write('A');
        delay(750);
      }
    }
    else if(GD == false)
    {
      port.write('S');
      delay(1250);
      port.write('D');
      delay(750);
    }
  }
  catch(Exception ai)
   {
    println("ERROR OCCURED : "+ai.toString());
  } 
}


int r=0,g=0,b=0,t=0;

void graphics()
{
try
{
disable_keys = true;  
if(keyPressed)
{
disable_keys = false ;   
wtime=0;
return;
}
background(0);
text("RoVER Mission Control ",x+100,y-25);
text("SCREEN SAVER ACTIVATED ",x+100,y+100);
text("PRESS ANY KEY TO RETURN TO PROGRAM . ",x+50,y+500); 
for (float a = 0; a < TWO_PI; a+= 0.2) 
{ 
 pushMatrix();
 translate(width/2, height/2);
 rotate(a+sin(frameCount*0.004*a));
 stroke(r,g,b);
 line(-100, 0, 100, 0);
 popMatrix();
 if(r==49&&g==-1&&b==-1)
  t=0;
  else if(r==256&&g==256&&b==256)
  t=1;
  if(t==1)
  {
  if(b>=0)
  b--;
  if(g>=0&&b==-1)
  g--;
  if(r>=50&&g==-1&&b==-1)
  {
    r--;
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
  }
  }
  }
}
catch(Exception g)
 {
    for(int l=0;l<g.toString().length();l++)
    text("ERROR OCCURED : "+g.toString(),x-200,y+510+(l*25));
  } 
}


void setClock()
{
  stroke(255);
  int radius = 70;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  cx = 150;
  cy = 120;
}

int rtime = 0;
void clock()
{
  try
  {
  if(rtime == 0)
  setClock();
  rtime++;
  // Draw the clock background
  fill(80);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  }
  catch(Exception c)
   {
    for(int l=0;l<c.toString().length();l++)
    text("ERROR OCCURED : "+c.toString(),x-200,y+510+(l*25));
  } 
}

