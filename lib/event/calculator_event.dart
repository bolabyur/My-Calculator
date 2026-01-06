abstract class CalculatorEvent {}

class CalculateEvent extends CalculatorEvent {
  final double angka1;
  final double angka2;
  final String operator;

  CalculateEvent(this.angka1, this.angka2, this.operator);
}

class ResetCalculator extends CalculatorEvent {}
