import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/calculator_model.dart';
import '../event/calculator_event.dart';
import '../state/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorModel model;

  CalculatorBloc({CalculatorModel? model})
      : model = model ?? CalculatorModel(),
        super(CalculatorInitial()) {

    on<CalculateEvent>((event, emit) {
      final result = this.model.calculate(
        event.angka1,
        event.angka2,
        event.operator,
      );

      emit(CalculatorResult(result));
    });

    on<ResetCalculator>((event, emit) {
      emit(CalculatorInitial());
    });
  }
}

