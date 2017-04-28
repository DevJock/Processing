
int dlay = 0;

String lines[],plines[],sfile,pfile;
void setup()
{ // Path
  String path = sketchPath;
  File[] files = listFiles(path);
  for (int i = 0; i < files.length; i++) 
  {
    File f = files[i];
    String n = f.getName();  
    String ext = n.substring(n.length()-3,n.length());  
    if((ext.equals("txt")||ext.equals("TXT"))&&!f.isDirectory())
    sfile = n;
    if((ext.equals("dat")||ext.equals("DAT"))&&!f.isDirectory())
    pfile = n;
  }
  size(1280,800);
  background(0);
  PFont Font = createFont(PFont.list()[2], 20);
  textFont(Font);
  lines = loadStrings(sfile);
  plines = loadStrings(pfile);
}

void setSpeed()
{
  dlay = int(plines[0]);
}

int i=0,ii=0,ny=0,x=50,y=10;
void draw()
{
  try
  {  
  if(sfile == null || lines == null)
  {
  textSize(63);
  fill(255,0,0);
  text("FILE I/O ERROR : NO FILE TO READ",10,300);
  textSize(43);
  fill(255);
  text("PLACE ONLY TEXT FILE INSIDE PROGRAM DIRECTORY. ",30,350);  
  }
  else
  {  
  if(i<lines.length)
  {  
  setSpeed();
  ny=y+25+(ii*25);  
  text(lines[i],x,ny);
  Thread.sleep(dlay);
  i++;
  ii++;
  if(ny>=700)
  {
    ii=0;
    ny=10;
    background(0);
  }
  }
  else
  {
  textSize(73);
  fill(200,200,200);
  text("END OF FILE",300,300);
  textSize(43);
  fill(112,112,112);
  text("PROGRAM BY CHIRAAG BANGERA",280,350);  
  }
  }
  }
  catch(Exception d)
  {
    for(int l=0;l<d.toString().length();l++)
    text("ERROR OCCURED : "+d.toString(),x-200,y+510+(l*25));

  }
}


/**
 * Listing files in directories and subdirectories
 * by Daniel Shiffman.  
 * 
 * This example has three functions:<br />
 * 1) List the names of files in a directory<br />
 * 2) List the names along with metadata (size, lastModified)<br /> 
 *    of files in a directory<br />
 * 3) List the names along with metadata (size, lastModified)<br />
 *    of files in a directory and all subdirectories (using recursion) 
 */




// Nothing is drawn in this program and the draw() doesn't loop because
// of the noLoop() in setup()


// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

// This function returns all the files in a directory as an array of File objects
// This is useful if you want more info about the file
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}

// Function to get a list ofall files in a directory and all subdirectories
ArrayList listFilesRecursive(String dir) {
   ArrayList fileList = new ArrayList(); 
   recurseDir(fileList,dir);
   return fileList;
}

// Recursive function to traverse subdirectories
void recurseDir(ArrayList a, String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    // If you want to include directories in the list
    a.add(file);  
    File[] subfiles = file.listFiles();
    for (int i = 0; i < subfiles.length; i++) {
      // Call this function on all files in this directory
      recurseDir(a,subfiles[i].getAbsolutePath());
    }
  } else {
    a.add(file);
  }
}
