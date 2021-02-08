class Pipe{
  
  int spacing=125;
  int center=(int)random(spacing, height - spacing);
  float top=center - spacing / 2;;
  float bottom=height - (center + spacing / 2);;
  float x=width;
  float w=50;
  int speed = 5;
  boolean colors=false;
  
  public void drawPipe(){
    fill(0);
    if(colors){
      fill(110);
    }
    rect(x,0,w,top);
    rect(x,height-bottom,w,bottom);
  }
  
  public boolean isOutOfScreen(){
    return x< -w;
  }
  
  public void update(){
    x -= speed;  
  }
  
  public boolean hits(Bird b){
    if(b.y<top || b.y>height - this.bottom){
      if(b.x>x && b.x < x + w){
        return true;
      }
    }
    return false;
  }
  
  public void chnageColor(){
    colors=true;
  }
  
}
