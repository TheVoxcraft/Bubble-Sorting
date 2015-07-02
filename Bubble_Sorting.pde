int windowX = 800; //Default 800 X 600
int windowY = 600;
int swaps = 0;
int[] stack = new int[windowX];
String algorithm = "Bubble Sorting";
int passes = 0;
boolean passed = false;
int counter = 1;
int temp;
int old_swaps;

void setup(){
  background(0,0,0);
  frameRate(10000);
  size(windowX,windowY);
  noStroke();
  
  for (int i = 0; i < stack.length; i++){
    stack[i] = (int)random(0,windowY-25);
  }
}

void draw(){
  frame_c++;
  background(0,0,0);
  fill(255,0,0);
  
  // Draws Stack
  for (int j = 0; j < stack.length; j++){
    rect(j,stack[j],1,windowY);
  }
  
  // Sorting Algorithm
  if(passed == false){
    //println("1st if (1)");
    if(counter <= windowX-2){
      //println("2nd if");
      if(stack[counter] > stack[counter+1]){
        //println("3rd if (1)");
        temp = stack[counter+1];
        stack[counter+1] = stack[counter];
        stack[counter] = temp;
        counter++;
        swaps++;
      }
      else{
        //println("3rd if (2)");
        counter++;
      }
    }else{
      //println("1st if (2)");
      counter = 1;
      passes++;
    }
  }
  
  
  
  
  fill(255,255,255);
  text("Swaps: "+swaps+"     Algorithm: "+algorithm+"     Passes: "+passes+"     Speed: "+getAvgFPS()+"/Avg Swaps per Second",15,20);
}


// Make Average
float avg;
float allfps;
int avg_t = 0;
int frame_c = 0;

int getAvgFPS(){
  allfps += frameRate;
  avg_t++;
  avg = allfps / avg_t;
  if(frame_c == avg*10){frame_c = 0; avg = 0;}
  return (int)avg;
}
