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

  Square(float tempXdefault, float tempYdefault) {
    defaultX = tempXdefault;
    defaultY = tempYdefault;

    currentX = defaultX;
    currentY = defaultY;

    alpha = shade[3];
    
  }

  void locationX() {
    if (maxXdiff > 0) {
      xDiff = xDiff + xDir;
      if ((currentX >= (width - (sizeX/2))) || (xDiff >= maxXdiff)) {
        xDir = (random(1, 5) * -1);
      }

      if ((currentX <= (0 + (sizeX/2))) || (xDiff <= (maxXdiff * -1))) {
        xDir = random(1, 5);
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
        yDir = (int(random(1, 10)) * -1);
      }

      if ((currentY <= (0 + (sizeY/2))) || (yDiff <= (maxYdiff * -1))) {
        yDir = int(random(1, 10));
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
    rect(currentX, currentY, sizeXslewed, sizeYslewed);
  }
}