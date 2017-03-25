import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

import oscP5.*;

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
  size(1280, 960, P3D);
  PJOGL.profile=1;
}

void setup() {

  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");

  //size(400, 400);
  //fullScreen();


  oscP5 = new OscP5(this, 12000);

  oscP5.plug(this, "test0", "/test0");
  oscP5.plug(this, "test1", "/test1");
  oscP5.plug(this, "test2", "/test2");
  oscP5.plug(this, "test3", "/test3");

  oscP5.plug(this, "SizeX", "/SizeX/x");
  oscP5.plug(this, "SizeY", "/SizeY/x");
  oscP5.plug(this, "Red", "/Red/x");
  oscP5.plug(this, "Green", "/Green/x");
  oscP5.plug(this, "Blue", "/Blue/x");
  oscP5.plug(this, "Xrange", "/Xrange/x");
  oscP5.plug(this, "Yrange", "/Yrange/x");
  oscP5.plug(this, "Speed", "/Speed/x");

  rectMode(CENTER);

  square[0] = new Square((width * 0.125), height/2);
  square[1] = new Square((width * 0.375), height/2);
  square[2] = new Square((width * 0.625), height/2);
  square[3] = new Square((width * 0.875), height/2);

  noStroke();
}

void draw() {

  background(0, 0);

  for (int i = 0; i <= 3; i++) {
    square[i].updatePerlin();
    square[i].locationX();
    square[i].locationY();
    square[i].create();
  }

  server.sendScreen();
}