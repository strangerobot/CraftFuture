float noisescale=0.02;
float time=0.0001;
float scale=2;

void setup()
{
 size(800,800,P3D); 
 frameRate(30);
}

void draw()
{
 time+=0.01;
  
 background(48,0,255);
 stroke(255,105);
 fill(0,1);
 noFill();
 camera(0, mouseY, mouseX, // eyeX, eyeY, eyeZ
         width/2, 100, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0);

 for(int i=0;i<360;i+=3)
 {
 
 pushMatrix();
 translate(width/2,0);
 rotateY(i*(PI/180));
 translate((-30-15*noise(time))*scale,0);
 beginShape();
 curveVertex(30*scale,0*scale);
 curveVertex(30*scale,0*scale);
 curveVertex((-20*noise(time+700))*scale,0*scale);
 curveVertex((5+10*noise(time+40))*scale,(10+20*noise(time+2000))*scale);
 curveVertex((-20-30*noise(time+200))*scale,(30+50*noise(time+900))*scale);
 curveVertex((-20*noise(time+120))*scale,(200-100*noise(time+350))*scale);
 curveVertex((40-20*noise(time+300))*scale,(200-100*noise(time+50))*scale);
 curveVertex((40-20*noise(time+300))*scale,(200-100*noise(time+50))*scale);
 endShape();


         
 popMatrix();
 }
 
}
