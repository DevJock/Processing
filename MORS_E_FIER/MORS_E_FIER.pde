import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim m;
Minim m2;
AudioPlayer beep_high;
AudioPlayer beep;
int asci[] = {65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,49,50,51,52,53,54,55,56,
            57,48};

String morse="";

String  chars="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
//             012345678901234567890123456789012345
// d = dot = tone , s= space = dash = no tone
String ccod[]={"ds","sddd","sdsd","sdd","d","ddsd","ssd","dddd","dd","dsss","sds","dsdd","ss","sd","sss","dssd",
               "ssds","dsd","ddd","s","dds","ddds","dss","sdds","sdss","ssdd","dssss","ddsss","dddss","dddds",
               "ddddd","sdddd","ssddd","sssdd","ssssd","sssss"};

int x=1024,y=720;
String ver ="1.0";
boolean tswitch = true , exec_fin=false,frun = true;
String tin = "";

int xpos = 100 , ypos = 300;
char pc ;


void splash()throws InterruptedException
{
  background(0);
  textSize(99);
  fill(255,0,0);
  text("MORS-E-FIER",215,250);
  textSize(32);
  fill(122,122,122);
  text("VERSION -"+ver,635,320);
  textSize(25);
  fill(255);
  text("CONVERT TEXT TO SOUND (MORSE-CODE).",255,475);
  text("LOADING...",425,575);
  textSize(19);
  text("© 2013-2014 CHIRAAG BANGERA",325,650);
}

void Morse_Coder(char c)
{
 int ascii = c ;
 for(int i=0;i<asci.length;i++)
 {
 if(ascii == asci[i])
 morse=morse+ccod[i];
 }
 morse=morse+'\t';
}

void String_Decoder(String s)
{
  s=s.toUpperCase();
  for(int l = 0;l<s.length();l++)
  {
  char ch=s.charAt(l);
  Morse_Coder(ch);
  }
}


void beeper(String in)
{
  int index = 0;
  String w ="";
  for(int i=0;i<in.length();i++)
  {
    char ch = in.charAt(i);
    if(ch=='\t')
    {
     w = in.substring(index,i);
     index=i+1;
    }
    println(w);
    for(int j=0;j<w.length();j++)
    {
      delay(45);
      char bs = w.charAt(j);
      if(ch=='d')
      {
      morse_print('d');  
      beep.play();
      }
      else if(ch=='s')
      {
        morse_print('s');
        beep_high.play();
      }
      else
      morse_print(' ');
    }
  }
  exec_fin = true ;
}

void keyPressed()
{
  if(tswitch==true)
  {
    tin =tin+key;
    println(key+" "+int(key));
    tin=tin.toUpperCase();
    if(int(key) == 10  )
    { 
    tswitch = false ;
    }
  }
}

void convert(String input)throws InterruptedException
{
  println(morse);
  String_Decoder(input);
  Thread.sleep(50);
  beeper(morse);
}

void anim()
{
  fill(122,122,122);
  text("10010010",600,50);
  fill(0);
  rect(600,30,110,50);
  fill(122,122,122);
  text("00100101",600,50);
  fill(0);
  rect(600,30,110,50);
  fill(122,122,122);
  text("01001010",600,50);
  fill(0);
  rect(600,30,110,50);
  fill(122,122,122);
  text("10010100",600,50);
  fill(0);
  rect(600,30,110,50);
  fill(122,122,122);
  text("00101000",600,50);
  fill(0);
  rect(600,30,110,50);
  fill(122,122,122);
  text("01010001",600,50);
  fill(0);
  rect(600,30,110,50);
  fill(122,122,122);
}


void morse_print(char p)
{
  
  background(0);
  textSize(45);
  fill(255,0,0);
  text("MORS-E-FIER",390,43);
  textSize(11);
  fill(122,122,122);
  text("VERSION -"+ver,615,63);
  textSize(13);
  text("© 2013-2014 CHIRAAG BANGERA",420,700);
  if(p == 'd')
  pc = '.' ;
  else if( p == 's')
  pc = '_' ;
  else 
  pc = ' ';
  text(pc,xpos,ypos);
  if(xpos < 1010)
  {
  xpos = xpos + 10 ;
  ypos = ypos ;
  }
  else
  {
   xpos = 0;
   ypos = ypos + 30 ;
  }
}

void draw()
{
  try
  {
    background(0);
    textSize(45);
    fill(255,0,0);
    text("MORS-E-FIER",390,43);
    textSize(11);
    fill(122,122,122);
    text("VERSION -"+ver,615,63);
    textSize(13);
    text("© 2013-2014 CHIRAAG BANGERA",420,700);
    if(frun)
    {
    delay(2900);
    frun = false ;
    }
    textSize(21);
    fill(255);
    text("ENTER A STRING",200,200);
    text(tin,200,300);
    if(tswitch == false)
    {
      convert(tin);
      textSize(25);
      text("PRESS ESCAPE TO EXIT.",400,600);
    }
    if(exec_fin && int(key) ==27 && keyPressed == true)
    {
    exit();
    }
  }
   catch(Exception se)
  {
  println(se.toString());
  }
}


void setup()
{
  try
  {
  size(x,y);
  splash();
  m = new Minim(this);
  m2 = new Minim(this);
  beep = m.loadFile("beep.wav"); 
  beep_high = m.loadFile("beep_high.wav");
  }
  catch(Exception se)
  {
  println(se.toString());
  }
}




