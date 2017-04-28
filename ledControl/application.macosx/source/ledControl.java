import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ledControl extends PApplet {




ControlP5 cp5;
Serial port;
int chos_port = 7;
int myColor = color(0,0,0);
int redValue = 0;
int greenValue = 0;
int blueValue = 0;
Slider abc;
boolean up = true ;

public void createPort()
{
  port = new Serial(this,"/dev/tty.usbmodem1451",9600);
  port.bufferUntil('\n');
}


public void setup() 
{
  println(Serial.list());
  createPort();
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);

  cp5.addSlider("redValue")
     .setPosition(100,50)
     .setRange(0,255)
     .setSize(255,50)
     ;

  cp5.addSlider("greenValue")
     .setPosition(100,120)
     .setRange(0,255)
     .setSize(255,50)
     ;

  cp5.addSlider("blueValue")
     .setPosition(100,190)
     .setRange(0,255)
     .setSize(255,50)
     ;


}

public void looper()
{
  if(up)
  {
   if(blueValue >= 255)
    up = false; 
  if(greenValue >= 255)
  blueValue += 1;
  else if(redValue >= 255)
  greenValue += 1;
  else 
  redValue +=  1;
  }
  else
  {
  if(redValue <= 0)
  up = true; 
  if(greenValue <= 0)
  redValue -= 1;
  else if(blueValue <= 0)
  greenValue -= 1;
  else 
  blueValue -=  1;
  }
  
}


public static String leftPad(int n, int padding) 
{
    return String.format("%0" + padding + "d", n);
}

public void setRGB (int b, int g, int r) 
{
  port.write('S'); 
  port.write(r); 
  port.write(g); 
  port.write(b); 
}

public void draw() 
{
 //looper();
  background(0);
  fill(redValue,0,0);
  rect(0,50,width,50);
  
  fill(0,greenValue,0);
  rect(0,120,width,50);
  
  fill(0,0,blueValue);
  rect(0,190,width,50);
  
  setRGB(255 - redValue , 255 - greenValue , 255 - blueValue);
  
  fill(redValue,greenValue,blueValue);
  rect(width/2 - 100,height/2 + 100,170,170);
  
}

public void slider(float theColor) 
{
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}


public void serialEvent(Serial port)
{
  try
  {

}
catch(Exception se)
{
 println("ERROR OCCURED : "+se.toString()); 
} 

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ledControl" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
