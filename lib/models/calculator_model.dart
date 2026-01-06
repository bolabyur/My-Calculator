class CalculatorModel {
  double calculate(double angka1, double angka2, String operator) {
    switch (operator) {
      case '+':
        return angka1 + angka2;
      case '-':
        return angka1 - angka2;
      case '*':
        return angka1 * angka2;
      case '/':
        if (angka2 == 0) return 0;
        return angka1 / angka2;
      default:
        return 0;
    }
  }
}
