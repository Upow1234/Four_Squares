// assumes the minimum value is 0!!!

// this function maps a linear range to an exponential range with the same maximum value
// for example: take the range 0 to 127 and for each of the 128 steps, 
// calculate its value exponentially rather than linearly

float expoentialRange(float max, float exponent, float value, float steps) {

  // this is the formula to solve for the exponent for example 2^x=127
  // since x^0 = 1 we add one  here to offset our expoential range from "1 to x" to "1 to x+1"
  // we bring the range back to "0 to x" by subtracting 1 from our expoential value at the end of the calculation

  float x = log(max + 1.0)/log(exponent);

  // this takes the exponent solved in the previous line and divides it by the number of steps in the expoential range
  // this allows us to calculate our incrementing exponent

  float power = (x / steps); 

  // returns the current input value scaled to the exponential range
  return (pow(exponent, (power * value)) - 1.0);
}