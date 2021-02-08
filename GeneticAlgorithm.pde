class GeneticAlgorithm{
  
   ArrayList<Bird> mutationPool=new ArrayList();
  
  
  public void nextGeneration(){
    System.out.println("Srting new Generations------------------------------");
    
    calculateFitness();
    for(int i=0;i<POPULATION;i++){
      Bird b=this.pickOne();
      birds.add(b);
    }
    //exit();
    savedBird.clear();
    mutationPool.clear();
  }
  
  public Bird pickOne(){
   /* int index = 0;
    double r=random(1);
    while(r>0){
      r=r-savedBird.get(index).fitness;
      index++;
    }
    index--;
    
    Bird b=savedBird.get(index);
    System.out.println(b.ToString());
    Bird child=new Bird(b.brain);
    return child;*/
    int i = (int)(Math.random()*mutationPool.size());
    Bird b = mutationPool.get(i);
    Bird child=new Bird(b.brain);

    return child;
      
  }
  public void calculateFitness(){
   // System.out.println("all populations ---------------------------");
    double sum=savedBird.get(0).score;
    for(Bird b:savedBird){
      if(sum < b.score){
        sum=b.score;
        //System.out.println(b.ToString());
      }
    }
    
    for(Bird b:savedBird){
      b.fitness=b.score/sum * 100;
      for(int j=0;j<b.fitness;j++){
        mutationPool.add(b);
      }
    }  
  }
}
