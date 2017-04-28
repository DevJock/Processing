/*  CUSTOMIZABLE COUNT DOWN APP® 

    Programmed and Developed By Chiraag Bangera
    
    Code has been completely rewritten , this was written on top of The New
    
    Year CountDown App with Heavy Modifications 
        
    Some Bugs have been Fixed
    
    No modification of Code allowed 
    
    Contact me @ chiraagxbl@live.com
    
    © Chiraag Bangera 2013 - 2014

*/

int d,mo,yr,h,m,s,ch,cm,cs,ryr,rd,rmo,rh,rm,rs;
int x,y;
int smo,sd,sh,sm,ss;
int fs ;
int gtime;
boolean active = true , stopp =false,thirtyonedays = false,leapyear = false;
String title , message ,lines[] ;

void setup()
{
  try
  {
  lines = loadStrings("preferences.txt");
  size (1200,720);
  smooth();
  x=70;
  y=220;
  fs = 28;
  }
  catch(Exception s)
  {
  }
}

void getTime()
{
  mo=month();
  yr=year();
  d=day();
  h=hour();
  m=minute();
  s=second();
}

void getDifference(int dmo,int dd,int dh,int dm,int ds)
{
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
void draw()
{
 if(d<=2&&mo<=1)
 nyr=yr; 
 else
 nyr=yr+1;
 background(0);
 if(!stopp)
 {
 getTime();
 getDifference(smo,sd,sh,sm,ss);
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
 text("COUNTDOWN TO "+title,255,105);
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
 text("Version 3.0.0",10,10);
 c++;
 graphics();
   if(gg())
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

void graphics()
{
try
{
if(active)  
for (float a = 0; a < TWO_PI; a+= 0.2) 
{ 
 pushMatrix();
 translate(600,570);
 rotate(a+sin(frameCount*0.004*a));
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


void greet()
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
 fill(100,100,100);
 text(message,100,300); 
 textSize(182);
 fill(yre,yg,yb);
 text(yr,100,570); 
 textSize(12);
 fill(255);
 text("APP BY CHIRAAG BANGERA",10,710);
 text("Version 3.0.0",10,10);
}

boolean value = false ;
boolean gg()
{
  return(value);
}

String str;
int j=0;
void analyse()
{
  for(int i =0;i<lines.length;i++)
  {
    if(lines[i].equalsIgnoreCase("title"))
    {
      title = lines[i+1];
    }
    else if(lines[i].equalsIgnoreCase("message"))
    {
      message = lines[i+1];
    }
    else if(lines[i].equalsIgnoreCase("time"))  
    {                                       //  mm/dd-hh/m m / s s
                                            //  012345678910111213
    
      smo = int(lines[i+1].substring(0,1));
      sd = int(lines[i+1].substring(3,4));
      sh = int(lines[i+1].substring(6,7));
      sm = int(lines[i+1].substring(9,10));
      ss = int(lines[i+1].substring(12,13));
    }
    else if(lines[i].equalsIgnoreCase("greet-duration"))
    {
      gtime = int(lines[i+1]);
    }
  }
      
  
}
   


