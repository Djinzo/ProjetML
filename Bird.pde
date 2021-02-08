class Bird{
    float x;
  float y;
  float gravity;
  float velocity;
  float jumpForce;
  NeuralNetwork brain;
  double score;
  double fitness;
  
  
  public Bird(){
  x=100;
  y=height/2;
  gravity=0.6;
  velocity=0;
  jumpForce=-15;
  
  brain=new NeuralNetwork(5,8,2);
  score = 0;
  fitness=0;
  }
  
  public Bird(NeuralNetwork brain){
  x=100;
  y=height/2;
  gravity=0.6;
  velocity=0;
  jumpForce=-15;
  this.brain=brain;
  this.brain.mutate(norml);
  score = 0;
  fitness=0;
  }
  
  

  
  
  public void think(ArrayList<Pipe> pipes){
    
    
    //pick the pip in the front
    Pipe closestPip=null;
    double record=Double.MAX_VALUE;
    
     for (int i = 0; i < pipes.size(); i++) {
      double diff = (pipes.get(i).x + pipes.get(i).w) - this.x;
      if (diff > 0 && diff < record) {
        record = diff;
        closestPip = pipes.get(i);
      }
    }
    
    
    
    if(closestPip!=null) {
    double[] input=new double[5];
    input[0]=this.y/height;
    input[1]=closestPip.top/height;
    input[2]=closestPip.bottom/height;
    input[3]=closestPip.x/width;
    input[4]=this.velocity/10;
    
    ArrayList<Double> output=brain.getPredection(input);
    if(output.get(0)>output.get(1)){
      this.jump();
    }
    }
  }
  
  public void drawBird(){
    stroke(0);
    fill(0,50);
    circle(x,y,50);
    
    
  }
  
  public void jump(){
    velocity += jumpForce;
    
  }
  
  public void update(){
    score++;
    velocity+=gravity;
    velocity *=0.9;
    y+=velocity;
   
   
   if(y>height){
     y=height;
     velocity=0;
   }
   if(y<0){
     y=0;
     velocity=0;
   }
  }
  
  public String ToString(){
    return "Score :" +score + "fitness :" + fitness;
  }
}
