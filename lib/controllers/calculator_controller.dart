import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator_bloc.dart';
import '../event/calculator_event.dart';

class CalculatorController {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();

  void calculate(BuildContext context, String operator) {
    final angka1 = double.tryParse(aController.text) ?? 0;
    final angka2 = double.tryParse(bController.text) ?? 0;

    context.read<CalculatorBloc>().add(
          CalculateEvent(angka1, angka2, operator),
        );
  }

  void reset(BuildContext context) {
    aController.clear();
    bController.clear();
    context.read<CalculatorBloc>().add(ResetCalculator());
  }

  void dispose() {
    aController.dispose();
    bController.dispose();
  }
}
