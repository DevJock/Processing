import processing.serial.*;

Serial port;
String portName = null;

int currentServoPos;
float distance;

void setup()
{
  size(800,600);
  smooth();
  selectPort();
  createPort();
  writePort(1);
}

void draw()
{
 try
 {
   background(0);
   text("Distance: "+distance,10,550);
   
   
   
   
   
   if(keyPressed)
   {
     if(keyCode == LEFT)
     {
       if(currentServoPos < 10)
       currentServoPos += 1;
     }
     if(keyCode == RIGHT)
     {
       if(currentServoPos > 2)
       currentServoPos -= 1;
     }
     writePort(currentServoPos);
   }  
 }
 catch(Exception e)
 {
   println("Error Occurred :\\");
 }
  
}




void map()
{
  writePort(0);
  text(".",x
  
}

void serialEvent(Serial port)
{
  try
  {
    distance = float(port.readStringUntil('\n'));
  }
  catch(Exception e)
  {
    println("Error: "+e.toString());
  }
}


void writePort(int integer)
{
  char ch = ' ';
  switch(integer)
  {
    case 1: ch = '1'; break;
    case 2: ch = '2'; break;
    case 3: ch = '3'; break;
    case 4: ch = '4'; break;
    case 5: ch = '5'; break;
    case 6: ch = '6'; break;
    case 7: ch = '7'; break;
    case 8: ch = '8'; break;
    case 9: ch = '9'; break;
    case 10: ch = '0'; break;
  }
  port.write(ch);
  println("Sent to Port: "+ch);
}

// Serial Functions

void createPort()
{
  try
  {
   port = new Serial(this,portName,9600);
   port.bufferUntil('\n');
   println("Opened Serial Port");
  }
   catch(Exception e)
  {
    println("Error during port Creation :(");
  }
}


void selectPort()
{
  String ports[] = Serial.list();
  try
  {
    for(int i=0;i<ports.length;i++)
    {
      String sub = ports[i].substring(9,17);
      //println(sub);
      if(sub.equals("usbmodem"))
      {
        portName = ports[i];
        println("Found Board: "+portName);
        break;
      }
    }
    if(portName == null)
    println("No Board Found");
  }
  catch(Exception e)
  {
    println("Error during port Discovery :(");
  }
}

