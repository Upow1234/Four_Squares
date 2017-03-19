void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  /*println();
   println("Controller Change:");
   println("--------");
   println("Channel:"+channel);
   println("Number:"+number);
   println("Value:"+value);*/

  if ((channel == 0) && (number == 7)) {
    sizeX = map(value, 0, 127, 0, width/4);
  }

  if ((channel == 1) && (number == 7)) {
    sizeY = map(value, 0, 127, 0, height);
  }

  if ((channel == 2) && (number == 7)) {
    shade[0] = map(value, 0, 127, 0, 255);
  }

  if ((channel == 3) && (number == 7)) {
    shade[1] = map(value, 0, 127, 0, 255);
  }

  if ((channel == 4) && (number == 7)) {
    shade[2] = map(value, 0, 127, 0, 255);
  }

  if ((channel == 5) && (number == 7)) {
    maxXdiff = expoentialRange(width/8, 1.2, value, 128);
  }

  if ((channel == 6) && (number == 7)) {
    maxYdiff = expoentialRange(height, 1.2, value, 128);
  }

  if ((channel == 7) && (number == 7)) {
    slewRate = map(value, 0, 127, 0, slewRateMax);
  }
  
}