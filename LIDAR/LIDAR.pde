import processing.serial.*;

Serial port;
String range;

String ports[] = {"/dev/tty.Bluetooth_Bee_V2-DevB","/dev/tty.wchusbserial1420"};

void setup()
{
  println("Initialising\n");
  try
  {
    println("Opening Wireless Port");
    port = new Serial(this,ports[0],9600);
  }
  catch(Exception e)
  {
    port = null;
    println("Failed to open Wireless Port");
    println("Now Opening Serial Port");
    port = new Serial(this,ports[1],9600);
    println("Opened Serial Port");
  }
  port.bufferUntil('.');
  size(800,600);
  
}


void draw()
{
  background(0);
  text(range,300,300);
}


void serialEvent(Serial port)
{
  try
  {
    range = "";
    range = port.readStringUntil('.');
    range = range.substring(0,range.indexOf(','));
  }
  catch(Exception e)
  {
    
  }
}
