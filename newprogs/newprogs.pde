import processing.serial.*;

int chos_port = 4;
Serial port;
String inData;
int x=1280,y=0;
void setup()
{
  try
  {
   // println(Serial.list());
  size(1280,800);
  background(0);
  PFont Font = createFont(PFont.list()[2], 20);
  textFont(Font);
  
  createPort();
  }
  catch(Exception z)
  {
    println(z);
  }
}

void createPort()
{
  port = new Serial(this,Serial.list()[chos_port],9600);
  port.bufferUntil('\n');
}




void serialEvent(Serial port)
{
  try
  {  
 inData=port.readStringUntil('\n');
  }
catch(Exception se)
{
 println("ERROR OCCURED : "+se.toString()); 
} 

}


void draw()
{
  try
  {
   
    background(0);
  
     //float d=(Integer.parseInt(inData)+3)*2/340.29 ;//= (time*340.29/2/10000)-3
   //background(0,0,d);
     text("SELECTED PORT: "+Serial.list()[chos_port],100,100);
    text("DATA: "+inData,100,200);
      // println(d);
  }
  catch(Exception e)
  {
    println("ERROR OCCURED : "+e.toString()); 
  }
}
