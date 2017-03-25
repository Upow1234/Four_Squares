public void SizeX(float sizeXtemp) {
  sizeX = map(sizeXtemp, 0, 1, 0, width/4);
}

public void SizeY(float sizeYtemp) {
  sizeY = map(sizeYtemp, 0, 1, 0, height);
}

public void Red(float redTemp) {
  shade[0] = map(redTemp, 0, 1, 0, 255);
}

public void Green(float greenTemp) {
  shade[1] = map(greenTemp, 0, 1, 0, 255);
}

public void Blue(float blueTemp) {
  shade[2] = map(blueTemp, 0, 1, 0, 255);
}

public void Xrange(float xRangeTemp) {
  maxXdiff = map(xRangeTemp, 0, 1, 0, width/8);
}

public void Yrange(float yRangeTemp) {
  maxYdiff = map(yRangeTemp, 0, 1, 0, height);
}

public void Speed(float speedTemp) {
  for (int i = 0; i <= 3; i = i + 1) {
    square[i].changeSpeed(speedTemp);
  }
}