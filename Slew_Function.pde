float slew (float destination, float displayed) {

  if (destination > displayed) {

    displayed = displayed + slewRate;
  }

  if (destination < displayed) {

    displayed = displayed + (slewRate * -1);
  } 

  return displayed;
}