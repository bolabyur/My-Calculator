abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {
  final double result;
  CalculatorInitial({this.result = 0});
}

class CalculatorResult extends CalculatorState {
  final double result;

  CalculatorResult(this.result);
}
