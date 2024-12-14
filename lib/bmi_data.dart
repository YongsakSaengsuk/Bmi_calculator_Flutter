String getBMICategory(bmi) {
  if(bmi == 0){
    return '';
  }
  else if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi < 24.9) {
    return 'Normal weight';
  } else if (bmi < 29.9) {
    return 'Overweight';
  } else {
    return 'Obesity';
  }
}