//your variable declarations here
SpaceShip mango;
boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;


public void setup() 
{
size(1000,1000);
background(30);
mango = new SpaceShip();
}


public void draw() 
{
   background(30);
  mango.show();
   mango.move();
   if(left == true)
  {
    mango.rotate(-5);    
  }
  if(right == true)
  {
    mango.rotate(5);
  }
  if(up == true)
  {
    mango.accelerate(0.1);
  }
  if(down == true)
  {
    mango.accelerate(-0.1);
  }
  
}

public void keyPressed() 
{
  if(keyCode == LEFT)
  {
    left = true;  
  }
  if(keyCode == RIGHT)
  {
    right = true;
  }
  if(keyCode == UP)
  {
    up = true;
  }
  if (keyCode == DOWN)
  {
    down = true;
  }

  if(key == 'H' || key =='h')
  {
    up = false;
    down =false;
    right =false;
    left = false;
   mango.setX(((int)Math.random()*800)); 
   mango.setY(((int)Math.random()*800));

  }
}

public void keyReleased() 
{
  if(keyCode == LEFT)
  {
    left = false;  
  }
  if(keyCode == RIGHT)
  {
    right = false;
  }
  if(keyCode == UP)
  {
    up = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
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
    myColor = 255;
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }
   public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}  
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;} 
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}  
  public double getDirectionY() {return myDirectionY;} 
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}
}


class Asteroid extends Floater
{
  public Asteroid()
  {
    corners = 5;
    int[] xS ={0,15,43,-20,0};
    int[] yS ={0,20,-25,-20,0}; 
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;

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
    stroke(myColor);    
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

