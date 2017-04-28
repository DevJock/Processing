import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class BT_VoltMeter_GUI extends PApplet {




Serial port;
String range = "NaN";
String ports[] = {"/dev/tty.Bluetooth_Bee_V2-DevB","/dev/tty.wchusbserial1420"};

public void setup()
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
  port.bufferUntil('\n');
  size(512,400);
  
}

public void draw()
{
  background(0);
  textSize(75);
  text("BT VoltMeter",(512/2 - 220),(512/2 - 100));
  textSize(100);
  text(range,(512/2 - 70*2),(512/2 + 70));
}


public void serialEvent(Serial port)
{
  try
  {
    range = "";
    range = port.readStringUntil('\n');
  }
  catch(Exception e)
  {
    println("Error: "+e.toString());
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "BT_VoltMeter_GUI" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
