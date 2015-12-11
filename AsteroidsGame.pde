//your variable declarations here
SpaceShip mango;
ArrayList <Asteroid>  rocks = new ArrayList <Asteroid>();
//ArrayList <Bullet> pew = new ArrayList <Bullet>();
Star[] estrella = new Star[250];

boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;
boolean w = false;
boolean a = false;
boolean d = false;

public void setup() 
{
size(1000,1000);
background(#042580);
mango = new SpaceShip();

for(int i=0;i<estrella.length;i++)
  {
    estrella[i] = new Star();
  }
  for(int i=0;i<30;i++)
  {
    rocks.add(i, new Asteroid());
  }
}




public void draw() 
{
   background(#042580);
 
for(int i=0;i<estrella.length;i++)
  {
    estrella[i].show();
  }
  for(int i=0;i<rocks.size();i++)
  {
    rocks.get(i).show();
    rocks.get(i).move();
  }





   
  mango.show();
  mango.move();
    if(w == true && a == true)
  {
    mango.accelerate(.15);
    mango.rotate(-7);
  }
  else if(w==true&&d==true)
  {
    mango.accelerate(.15);
    mango.rotate(7);
  }
  else if(w == true)
  {
    mango.accelerate(.15
      );
  }
  else if(a == true)
  {
    mango.rotate(-7);
  }
  else if(d == true)
  {
    mango.rotate(7);
  }
}
  

class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners =10;
    int[] xS = {12*2,5*2,5*2,0,-8*2,-4*2,-8*2,0,5*2,5*2,12*2};
    int[] yS = {0,-3*2,-10*2,-4*2,-7*2,0,6*2,4*2,10*2,2*2,0};
    xCorners = xS;
    yCorners = yS;
    myColor = #12B525;
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return myDirectionX;}  
  public void setDirectionY(double y){myDirectionY=y;}    
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;}
}

class Asteroid extends Floater
{
public void setX(int x){myCenterX = x;}//your code here
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  private double muns = (Math.random()*5-2);
  private int dums = (int)(Math.random()*4); 
  Asteroid()
  { 
    myDirectionX = (Math.random()*5-2);
    myDirectionY = (Math.random()*5-2);
    myColor = #9A9FA1;
    int rocksize = 10;
    corners = 21;
    int[] xS = {2*rocksize,2*rocksize,3*rocksize,3*rocksize,4*rocksize,4*rocksize,3*rocksize,3*rocksize,2*rocksize,2*rocksize,-2*rocksize,-2*rocksize,-3*rocksize,-3*rocksize,-4*rocksize,-4*rocksize,-3*rocksize,-3*rocksize,-2*rocksize,-2*rocksize,2*rocksize};
    int[] yS = {3*rocksize,2*rocksize,2*rocksize,1*rocksize,1*rocksize,-1*rocksize,-1*rocksize,-2*rocksize,-2*rocksize,-3*rocksize,-3*rocksize,-2*rocksize,-2*rocksize,-1*rocksize,-1*rocksize,1*rocksize,1*rocksize,2*rocksize,2*rocksize,3*rocksize,3*rocksize};
    xCorners = xS;
    yCorners = yS;
    
    if(dums==0)
    {
      myCenterX = 1;
      myCenterY = (int)(Math.random()*999+1);
    }
    else if(dums==1)
    {
      myCenterX = (int)(Math.random()*999+1);
      myCenterY = 1;
    }
    else if(dums==2)
    {
      myCenterX = 699;
      myCenterY = (int)(Math.random()*999+1);
    }
    else if(dums==3)
    {
      myCenterX = (int)(Math.random()*999+1);
      myCenterY = 999;
    }
  }
}







abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(0);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

class Star
{
  int myX, myY, mySize;
  Star()
  {
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
     mySize = (int)(Math.random()*12)+5;
  }
  void show()
  {
    fill(#C69CC8);
    strokeWeight(2);
    stroke(255);
    ellipse(myX,myY,mySize,mySize);
  }
}

public void keyPressed()
{
  if(key=='h')//hyperspace
  {
    mango.setX((int)(Math.random()*1000));
    mango.setY((int)(Math.random()*1000));
    mango.setPointDirection((int)(Math.random()*360));
    mango.setDirectionX(0);
    mango.setDirectionY(0);
    rect(0,0,1000,1000,150);
   
  }
  else if(key =='a')
  {
    a = true;
  }
  else if(key =='d')
  {
    d = true; 
  } 
  else if(key =='w')
  {
    w = true;
  }
  }
  public void keyReleased()
{
  if(key=='a')
  {
    a = false;
  }
  else if(key=='d')
  {
    d = false;
  }
  else if(key=='w')
  {
    w = false;
  }
}