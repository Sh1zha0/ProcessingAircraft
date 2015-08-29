class Sky { 
  int n = 60; 
  float speed = 1; 
  float[] x = new float [n]; 
  float[] y = new float [n]; 
  float[] d = new float [n]; 

Sky () { 
} 

void setup() { 
  for (int i=0; i<n; i++) { 
  if (i%5 == 0) 
  d[i] = random (0, 2); 
  else 
  d[i] = 3; 
  x[i] = random (0, width); 
  y[i] = random (-height, height*2); 
} 
} 
void move() { 
  for (int i=0; i<n; i++) { 
  y[i] += d[i]*speed; 
  if (y[i]>height*2) 
  y[i] = random (-height-100, -height+100); 
} 
} 
void display() { 
  fill (255); 
  noStroke(); 
  for (int i=0; i<n; i++) { 
    ellipse (x[i], y[i], d[i], d[i]); 
  } 
} 
}
