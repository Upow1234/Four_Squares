class Square {
  float defaultX;
  float defaultY;

  float currentX;
  float currentY;

  float xDiff = 0;
  float yDiff = 0;

  float alpha;

  float xDir = 1;
  float yDir = 1;
  
  float perlinX = 0;
  float perlinY = 0;
  
  float speed = 0.5;

  Square(float tempXdefault, float tempYdefault) {
    defaultX = tempXdefault;
    defaultY = tempYdefault;

    currentX = defaultX;
    currentY = defaultY;

    alpha = shade[3];
    
  }
  
  void updatePerlin() {
   perlinX = perlinX + random(0.1, 0.5);
   perlinY = perlinY + random(0.1, 0.5);
  }
  
  void changeSpeed(float speedInput) {
    speed = map(speedInput, 0, 1, 0.5, 5);
  }

  void locationX() {
    if (maxXdiff > 0) {
      xDiff = xDiff + xDir;
      if ((currentX >= (width - (sizeX/2))) || (xDiff >= maxXdiff)) {
        xDir = noise(perlinX) * (speed * -1);
      }

      if ((currentX <= (0 + (sizeX/2))) || (xDiff <= (maxXdiff * -1))) {
        xDir = noise(perlinX) * speed;
      }

      currentX = defaultX + xDiff;
    }

    if ((maxXdiff == 0) && (currentX != defaultX)) {
      currentX = defaultX + 1;
    }
  }

  void locationY() {

    if (maxYdiff > 0) {
      yDiff = yDiff + yDir;
      if ((currentY >= (height - (sizeY/2))) || (yDiff >= maxYdiff)) {
        yDir = noise(perlinY) * (speed * -1);
      }

      if ((currentY <= (0 + (sizeY/2))) || (yDiff <= (maxYdiff * -1))) {
        yDir = noise(perlinY) * speed;
      }

      currentY = defaultY + yDiff;
    }

    if ((maxYdiff == 0) && (currentY != defaultY)) {
      currentY = defaultY + 1;
    }
  }

  void alphaChannel(float alphaTemp) {
    alpha =  (alphaTemp * 1275);
  }

  void create() {
    fill(shade[0], shade[1], shade[2], alpha);
    rect(currentX, currentY, sizeX, sizeY);
  }
}