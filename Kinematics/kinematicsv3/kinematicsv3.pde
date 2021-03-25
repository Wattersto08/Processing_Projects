

float Angle_Offset = 90;

void setup(){
  
  size(700,600);

}


void draw(){

  background(170);
  
  draw_limb(mouseX,mouseY,350,500);

 // draw_limb(360,100,160,400);

}

















void draw_limb(float X1, float Y1, float X2, float Y2){

  
  float J0[] = { 350, 100};
float J1[] = { 0, 0};
float J2[] = { 0, 0};
float J3[] = { 0, 0};


float Hlen = 200;
float Slen = 200; 

float Hlen_adj;
float Slen_adj;

  // Target Input
  J0[0] = X1;
  J0[1] = Y1;
  
  Hlen_adj = (Hlen/(Hlen + Slen));
  Slen_adj = (Slen/(Hlen + Slen));
  
  J2[0] = X2;//J0[0];//
  J2[1] = Y2;

  J3 = J2;  
  // Pythagros Solve
  
  float DX = J2[0] - J0[0];
  float DY = J2[1] - J0[1];
  
  float JointLen = sqrt(sq(DX) + sq(DY));
  
  // Target Angle Solve 
  
  float JointAng = degrees(acos((DX)/JointLen));
  
  // Draw Target Line
  strokeWeight(1);
  stroke(0, 255,255);
  line(J0[0],J0[1],J0[0]+(DX*Hlen_adj),J0[1]+(DY*Hlen_adj));
  stroke(255, 255,0);
  line(J0[0]+(DX*Hlen_adj),J0[1]+(DY*Hlen_adj),J3[0],J3[1]);
  
  // Hip Algle Calculations 
  
  float Hip_angle = JointAng - degrees(acos((JointLen*Hlen_adj)/Hlen)) ;

  print(" HA: ");
  print(Hip_angle);
  

  // Calculate Positions
  float HX = Hlen * cos(radians(Hip_angle));
  float HY = Hlen * sin(radians(Hip_angle));
  
  // Update Knee pos
  
  J1[0] = J0[0]+HX;
  J1[1] = J0[1]+HY;
  
  // Draw Thigh 
  strokeWeight(10);
  stroke(100,100,255);
  line(J0[0],J0[1],J1[0],J1[1]);
  
  

  // Shin Algle Calculations 
  
  float Knee_angle = JointAng  + degrees(acos((JointLen*Slen_adj)/Slen));//+ (90- Hip_angle);
  print(" KA: ");
  print(Knee_angle);
//println(JointLen);
  // Calculate Positions
  
  float SX = Slen * cos(radians(Knee_angle));
  float SY = Slen * sin(radians(Knee_angle));
  
  // Update Foot Pos
  
  J2[0] = J1[0] + SX;
  J2[1] = J1[1] + SY;
  
  // Draw Shin 
  
  stroke(100,100,255);
  line(J1[0],J1[1],J2[0],J2[1]);
  
}
