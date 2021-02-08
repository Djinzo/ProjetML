
final int POPULATION=100;
ArrayList<Bird> birds=new ArrayList();
ArrayList<Bird> savedBird=new ArrayList();
ArrayList<Pipe> pipes;
GeneticAlgorithm ge=new GeneticAlgorithm();

int counter = 0;

Normalisation norml=new Normalisation(){
  public double sigmoid(double x){
    if(random(1)<0.001){
      System.out.println("Moteted");
      return x+ randomGaussian()*0.1;
    }else{
      return x;
    }
  }
};



void setup(){
  
  size(500,500);
  for(int i=0;i<POPULATION;i++){
    birds.add(new Bird());
  }
  pipes=new ArrayList();

}

void draw(){
  background(255);
 
   if(birds.size()==0){
    ge.nextGeneration();
    pipes.clear();
    counter=0;
  }
  if(counter % 60 == 0){
    pipes.add(new Pipe());
  }
  counter++;
  
   for(int i=0;i<birds.size();i++){
     if(birds.get(i).y==height || birds.get(i).y==0 ){
       birds.get(i).score=1;
       savedBird.add(birds.remove(i));
     }
   }  

    for(int i=0;i<pipes.size();i++){
      Pipe p=pipes.get(i); 
      p.drawPipe();
      p.update();
      
      for(int j=0;j<birds.size();j++){
          if(p.hits(birds.get(j))){
            savedBird.add(birds.remove(j));
          }
      }

      if(p.isOutOfScreen()){
        pipes.remove(p);
      }
    }  
  for(int i=0;i<birds.size();++i){
    Bird bird=birds.get(i);
    bird.think(pipes);
    bird.update();
    bird.drawBird();
  }
  
}
