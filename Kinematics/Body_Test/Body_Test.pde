
float  root_x = width/2;
float root_y = height/2;

float rootpos[] = {400,200};
float f_Hippos[]={0,0};
float r_Hippos[]={0,0};

float h ;

void setup(){

size(800,600);


}



void draw(){
background(70);
  
  h = map(mouseY, 0, height, -20,80);
  
  // Calculate Positions
  float HX = 300 * cos(radians(map(mouseX,0,width,-15,15)));
  float HY = 300 * sin(radians(map(mouseX,0,width,-15,15)));
  
  // Update Knee pos
  
f_Hippos[0] = rootpos[0]+ HX;
f_Hippos[1] = rootpos[1]+h + HY;

r_Hippos[0] = rootpos[0]-HX;
r_Hippos[1] = rootpos[1]+h - HY;

  line(rootpos[0],rootpos[1]+h,f_Hippos[0],f_Hippos[1]);
  line(rootpos[0],rootpos[1]+h,r_Hippos[0],r_Hippos[1]);
  
  
 // line(width/2,h,width/2+HX,h+HY);
 // line(width/2,h,width/2-HX,h-HY);
  
  
}
