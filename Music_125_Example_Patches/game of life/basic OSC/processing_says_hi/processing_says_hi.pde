/*

  simple demo of osc communication between processing and pd
  sends a random number to pd when you click on the window
  
  dkant, music 128
  
*/

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {

  // init window
  size(400, 400);
  
  // init oscP5 and listen for incoming messages at port 5001
  oscP5 = new OscP5(this, 5001);
 
  // set the remote location to be the localhost on port 5001
  myRemoteLocation = new NetAddress("127.0.0.1", 5001);
  
}

void mousePressed() {  
  
  // create an osc message
  OscMessage myMessage = new OscMessage("/hellopd");
 
  // give it a random number
  float randomnumber = random(0,127);
  myMessage.add(randomnumber);
  
  // flash the background (for fun)
  background(random(0,127), random(0,127), random(0,127), random(0,127));
  
  // show the random number
  text(randomnumber, random(0,1)*width, random(0,1)*height);
 
  // send the message
  oscP5.send(myMessage, myRemoteLocation); 
}

void draw() {}
