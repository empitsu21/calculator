
class CalculatorBrain {

  // ignore: non_constant_identifier_names
  double BMI;

  double calculateIndex(weight, height) {
    BMI = (weight/((height/100)*(height/100)));
    print (BMI);
    return BMI;
  }

  getResult(bodyMassIndex) {
    if (bodyMassIndex < 18.5) {
      return 'Underweight';
    } else if (bodyMassIndex < 24) {
      return 'Normal';
    } else if (bodyMassIndex >= 24) {
      return 'Overweight';
    }
  }
  getInterpretation(bodyMassIndex) {
    if (getResult(bodyMassIndex) == 'Underweight') {
      return 'You have a lower than normal body weight. You can eat a bit more';
    } else if (getResult(bodyMassIndex) == 'Normal') {
      return 'You have a normal body weight. Good job!';
    } else if (getResult(bodyMassIndex) == 'Overweight') {
      return 'You have a higher than normal body weight Try to exercise more';
    }
  }
}