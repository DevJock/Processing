import processing.serial.*;



Serial port ;
char in;
float RF ;
boolean GD = false;
int frun = 1;
int o=0;


void setup()
{
  size(600,600);
  PFont Font = createFont(PFont.list()[2], 20);
  textFont(Font);
  println(Serial.list());
  String sel_port=Serial.list()[6];
  port = new Serial(this,sel_port,9600);
  port.bufferUntil('\n');
  
}


void keyPressed()
{
  if(o == 2)
  {
    in = key;
    if(in <'A' || in >'Z')
    println("ONLY UPPER CASE CHARACTERS ");
    else
    switch(in) 
    {
      case 'W': port.write('w'); break;
      case 'S': port.write('s'); break;
      case 'A': port.write('a'); break;
      case 'D': port.write('d'); break;
      case 'L': port.write('l'); break;
    }
    
  }
  else if(frun == 1)
  o = key - 48;
  println(o);
}


void serialEvent(Serial port)
{
  int index =0;
  String trf="" , tgd="" ,t="" ;
  t=port.readStringUntil('\n');
  for(int i=0;i<t.length();i++)
  {
    char ch=t.charAt(i);
    if(ch == ',')
    {
      trf=t.substring(index,i);
      index=index+i;
    }
  }
  float g = float(t.substring(index+1,t.length()));
  int gg =int(g);
  GD=boolean(gg);
  RF=float(trf);
}


void draw()
{
   try
  {
    if( o == 1)
  { 
    background(0);
    text("Autonomus Obstacle Avoider and Edge Detector",50,125);
    text("PRESS '2' FOR Remote Control ",125,175 );
    port.write('1');
  }
  else if( o == 2)
  {
  background(0);
  port.write('2');
  do
  {
  background(0);
  text("RoVER Control Version 1.0",100,125);
  text("               ^         ",100,150);
  text("               |         ",100,175);
  text("               W          ",100,200);
  text("       <-- A       D-->   ",100,225);
  text("               S        ",100,250);
  text("               |         ",100,275);
  text("               V        ",100,300);
  text("PRESS 'W' 'A' 'S' 'D' TO MOVE ROVER",100,350);
  text("PRESS 'L' TO TOGGLE LED(S) ON OR OFF",100,375);
  text("RANGE FINDER: "+RF,50,550);
  text("GROUND DETECT: "+GD,300,550);
  }while(!(in=='1'||in=='2'));
  }
  else if(frun==1)
    {
    background(0);
    text("RoVER Control Panel",100,125);
    text("CHOOSE AN OPTION ",100,150);
    text("1. AUTOBOT",100,175);
    text("2. Remote Control",100,200);
    frun = 2;
    }
  }
  catch(Exception e)
  {
    println("ERROR OCCURED : "+e.toString()); 
  }
}
