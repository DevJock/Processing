import processing.serial.*;


Serial port ;
int chos_port = 4;
char in;
float RF ;
boolean GD = false;


void setup()
{
  size(600,600);
  PFont Font = createFont(PFont.list()[2], 20);
  textFont(Font);
  println(Serial.list());
  String sel_port=Serial.list()[chos_port];
  port = new Serial(this,sel_port,9600);
  port.bufferUntil('\n');
  
}


void keyPressed()
{
  if(chos_port == 0)
  chos_port = key-48;
  else
  {
    in = key;
    if(in <'A' || in >'Z')
    println("ONLY UPPER CASE CHARACTERS ");
    else
    switch(in) 
    {
      case 'W': port.write('W'); break;
      case 'S': port.write('S'); break;
      case 'A': port.write('A'); break;
      case 'D': port.write('D'); break;
      case 'L': port.write('L'); break;
    }
    
  }
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
  if(chos_port == 0)
  {
  background(0,0,0);
  text("CHOOSE A COM PORT DEFAULT : SERIAL USB",100,125);
  text("1. BLUETOOTH",100,150);
  text("2. SERIAL USB",100,175);
  }
  else
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
  }
  }

  catch(Exception e)
  {
    println("ERROR OCCURED : "+e.toString()); 
  }
}
