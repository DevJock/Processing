import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class NewYear extends PApplet {

/*  New Year Wisher\u00ae  v2

    Programmed and Developed By Chiraag Bangera
    
    Code has been completely rewritten , this is now an universal app
    
    It starts counting for the next new year after Jan 2 of the current Year
    
    Some Bugs have been Fixed
    
    No modification of Code allowed 
    
    Contact me @ chiraagxbl@live.com
    
    \u00a9 Chiraag Bangera 2012 - 2013

*/

int d,mo,yr,h,m,s,ch,cm,cs,ryr,rd,rmo,rh,rm,rs;
int x,y;
int fs ;
boolean active = true , stopp =false,thirtyonedays = false,leapyear = false;

public void setup()
{
  size (1200,720);
  smooth();
  x=70;
  y=220;
  fs = 28;
}

public void getTime()
{
  mo=month();
  yr=year();
  d=day();
  h=hour();
  m=minute();
  s=second();
}

public void getDifference(int dyr,int dmo,int dd,int dh,int dm,int ds)
{
  ryr=dyr-yr;
  rmo=dmo-mo;
  if(mo==1||mo==3||mo==5||mo==7||mo==8||mo==10||mo==12)
  {
    rd=(dd-d);
  }
  else if(mo==4||mo==6||mo==9||mo==11)
  {
    rd=(dd-d-1);
  }
  if(mo==2 && yr%4==0)
  {
    rd=(dd-d-2);
  }
  else if(mo==2 && yr%4!=0)
  {
    rd=(dd-d-3);
  }
  rh=dh-h;
  rm=dm-m;
  rs=ds-s;
  if(mo<0)
  {
  ryr--;
  rmo=rmo+12;
  }
  if(rd<0)
  {
  rm--;
  if(thirtyonedays)  
  rd=rd+31;
  else if(!thirtyonedays)
  rd=rd+30;
  if(leapyear)
  rd=rd+29;
  else if(!leapyear)
  rd = rd + 28;
  } 
  if(rh<0)
  {
  rd--;  
  rh=24+rh;
  }  
  if(rm<0)
  {
  rh--;  
  rm=60+rm;
  }
  if(rs<0)
  {
   rm--;
   rs=60-rs;
  }
}



int c =0, nyr,r,g,b,hr,hg,hb;
public void draw()
{
 if(d<=2&&mo<=1)
 nyr=yr; 
 else
 nyr=yr+1;
 background(0);
 if(!stopp)
 {
 getTime();
 getDifference(nyr-1,12,31,23,59,60);
 }
 if(c == 100)
 {
   hr = 255;
 }
 else if(c == 200)
  {
    hr=0;
    hg= 255;
  }
 else if(c == 300)
  {
    hg=0;
    hb=255;
  }
  else if(c == 400)
  {
    hr=255;
    hg=255;
    hb=0;
  }
  else if(c==500)
  {
    hr=255;
    hg=0;
    hb=255;
  }
   else if(c==600)
  {
    hr=255;
    hg=255;
    hb=0;
  }
   else if(c==700)
  {
    hr=0;
    hg=0;
    hb=255;
  }
   else if(c==800)
  {
    hr=0;
    hg=255;
    hb=0;
  }
   else if(c==900)
  {
    hr=255;
    hg=0;
    hb=0;
    c=100;
  }
  
 textSize(42); 
 fill(hr,hg,hb);
 text("COUNTDOWN TO NEW YEAR "+nyr,255,105);
 if(d<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("CURRENT DATE & TIME: 0"+d+"/"+mo+"/"+yr+"  "+h+":"+m+":"+s,x,y);
 }
 else if(mo<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("CURRENT DATE & TIME: "+d+"/0"+mo+"/"+yr+"  "+h+":"+m+":"+s,x,y);
 }
 else if(h<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("CURRENT DATE & TIME: "+d+"/"+mo+"/"+yr+"  0"+h+":"+m+":"+s,x,y);
 }
 else if(m<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("CURRENT DATE & TIME: "+d+"/"+mo+"/"+yr+"  "+h+":0"+m+":"+s,x,y);
 }
 else if(s<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("CURRENT DATE & TIME: "+d+"/"+mo+"/"+yr+"  "+h+":"+m+":0"+s,x,y);
 }
 else //if(d>9&&mo>9&&h>9&&m>9&&s>9)
 {
 textSize(fs);
 fill(r, g, b); 
 text("CURRENT DATE & TIME: "+d+"/"+mo+"/"+yr+"  "+h+":"+m+":"+s,x,y);
 }
 if(rd<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("REMAINIG TIME: 0"+rd+" DAY(S) "+rmo+" MONTH(S) "+rh+" HOUR(S) "+rm+" MINUTE(S) "+rs+" SECOND(S)",x,y+100);
 }
 else if(rmo<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("REMAINIG TIME: "+rd+" DAY(S) 0"+rmo+" MONTH(S) "+rh+" HOUR(S) "+rm+" MINUTE(S) "+rs+" SECOND(S)",x,y+100);
 }
 else if(rh<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("REMAINIG TIME: "+rd+" DAY(S) "+rmo+" MONTH(S) 0"+rh+" HOUR(S) "+rm+" MINUTE(S) "+rs+" SECOND(S)",x,y+100);
 }
 else if(rm<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("REMAINIG TIME: "+rd+" DAY(S) "+rmo+" MONTH(S) "+rh+" HOUR(S) 0"+rm+" MINUTE(S) "+rs+" SECOND(S)",x,y+100);
 }
 else if(rs<10)
 {
 textSize(fs); 
 fill(r, g, b);
 text("REMAINIG TIME: "+rd+" DAY(S) "+rmo+" MONTH(S) "+rh+" HOUR(S) "+rm+" MINUTE(S) 0"+rs+" SECOND(S)",x,y+100);
 }
 else //if(rh>9&&rm>9&&rs>9)
 {
 textSize(fs); 
 fill(r, g, b);
 text("REMAINIG TIME: "+rd+" DAY(S) "+rmo+" MONTH(S) "+rh+" HOUR(S) "+rm+" MINUTE(S) "+rs+" SECOND(S)",x,y+100);
 }
 textSize(12);
 fill(255);
 text("APP BY CHIRAAG BANGERA",10,710); 
 text("Version 2.0.1",10,10);
 c++;
 graphics();
   if((d<=2&&mo==1))
  {
    greet();
    stopp = true;
  }
  else
  {
    active=true;
    stopp=false;
  }
}



int t=0;

public void graphics()
{
try
{
if(active)  
for (float a = 0; a < TWO_PI; a+= 0.2f) 
{ 
 pushMatrix();
 translate(600,570);
 rotate(a+sin(frameCount*0.004f*a));
 stroke(125,255);
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


public void greet()
{
 active = false; 
 getTime();
 int yre=0,yb=0,yg=0;
 if(yr%4==0)
 yb=255;
 else
 if(yr%2==0)
 yg=255;
 else
 yre=255;
 background(0);
 textSize(52); 
 fill(255);
 text("CHIRAAG WISHES",100,200); 
 textSize(52); 
 fill(100,100,100);
 text("YOU A HAPPY AND\nPROSPEROUS NEW YEAR ! ",100,300); 
 textSize(182);
 fill(yre,yg,yb);
 text(yr,100,570); 
 textSize(12);
 fill(255);
 text("APP BY CHIRAAG BANGERA",10,710);
 text(" APP WILL BEGIN COUNTDOWN TO "+(yr+1)+" AFTER JAN 2 "+yr,700,710); 
 text("Version 2.0.1",10,10);
}

public void setPref()
{
}

public void getPref()
{
}

public void defPref()
{
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#F20505", "NewYear" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
