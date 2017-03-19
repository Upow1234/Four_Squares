import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

import themidibus.*; 
import oscP5.*;

MidiBus myBus; 
OscP5 oscP5;

Square[] square = new Square [4];

float sizeX = 20;
float sizeY = 300;

float sizeXslewed = 20;
float sizeYslewed = 300;

float xDepth = 0;
float yDepth = 0;

float[] shade = {255, 0, 255, 255};

float maxXdiff = 0;
float maxYdiff = 0;

float slewRate = 1;
float slewRateMax = 2;

void settings() {
  size(640, 480, P3D);
  PJOGL.profile=1;
}

void setup() {

  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");

  //size(400, 400);
  //fullScreen();

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
  myBus = new MidiBus(this, 2, 3);

  oscP5 = new OscP5(this, 12000);

  oscP5.plug(this, "test0", "/test0");
  oscP5.plug(this, "test1", "/test1");
  oscP5.plug(this, "test2", "/test2");
  oscP5.plug(this, "test3", "/test3");

  rectMode(CENTER);

  square[0] = new Square((width * 0.125), height/2);
  square[1] = new Square((width * 0.375), height/2);
  square[2] = new Square((width * 0.625), height/2);
  square[3] = new Square((width * 0.875), height/2);

  noStroke();
}

void draw() {

  background(0, 0);

  sizeXslewed = slew(sizeX, sizeXslewed);
  sizeYslewed = slew(sizeY, sizeYslewed);

  for (int i = 0; i <= 3; i++) {
    square[i].locationX();
    square[i].locationY();
    square[i].create();
  }

  server.sendScreen();
}