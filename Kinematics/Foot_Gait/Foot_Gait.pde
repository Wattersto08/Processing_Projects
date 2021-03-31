
float  root_x = width/2;
float root_y = height/2;

float rootpos[] = {400,400};
float Foot_Pos[]={0,0};


float h ;

int i = 0;


void setup(){

size(800,600);


}



void draw(){
background(70);
  
  
update_gait(rootpos[0],rootpos[1], i);
  

   i++;
   if (i>360){i = 0;}
  

  
  
}



void update_gait(float x1, float y1,  float i){
  
  rootpos[0] = x1;
  rootpos[1] = y1;
  
  // Calculate Positions
  float FAX = 100 * cos(radians(i));
  float FAY = 100 * sin(radians(i));
  
  // Update Knee pos

  if (i > 180){
  Foot_Pos[0] = rootpos[0]+ FAX;
  Foot_Pos[1] = rootpos[1] + FAY;
  
  
  } else {
    
    Foot_Pos[0] = map(i,180,0,rootpos[0] - 100, rootpos[0]+100);
    Foot_Pos[1] = rootpos[1];
  }
  
  line(rootpos[0],rootpos[1]+h,Foot_Pos[0],Foot_Pos[1]);
  circle(rootpos[0],rootpos[1]+h, 10);
  circle(Foot_Pos[0],Foot_Pos[1], 10);
  
  //line(rootpos[0],rootpos[1]+h,r_Hippos[0],r_Hippos[1]);
   
   
  
 // line(width/2,h,width/2+HX,h+HY);
 // line(width/2,h,width/2-HX,h-HY);

}
