import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/calculator_bloc.dart';
import '../state/calculator_state.dart';
import '../colors/app_color.dart';
import '../controllers/calculator_controller.dart';

class CalculatorPage2 extends StatefulWidget {
  const CalculatorPage2({super.key});

  @override
  State<CalculatorPage2> createState() => _CalculatorPage2State();
}

class _CalculatorPage2State extends State<CalculatorPage2> {
  final CalculatorController controller = CalculatorController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColor.blue),
      filled: true,
      fillColor: AppColor.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.blue, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.blue, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        foregroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          'Simple Calculator',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// RESULT
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                final result = state is CalculatorResult ? state.result : 0;

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColor.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hasil',
                        style: TextStyle(color: AppColor.white, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        result.toString(),
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            /// INPUT (ROW + EXPANDED)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.aController,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColor.blue,
                    decoration: _inputDecoration('Angka 1'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: controller.bController,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColor.blue,
                    decoration: _inputDecoration('Angka 2'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// OPERATOR BUTTONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.calculate(context, '+'),
                    style: _buttonStyle(),
                    child: const Text('+', style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.calculate(context, '-'),
                    style: _buttonStyle(),
                    child: const Text('-', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.calculate(context, '*'),
                    style: _buttonStyle(),
                    child: const Text('*', style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.calculate(context, '/'),
                    style: _buttonStyle(),
                    child: const Text('/', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// RESET
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => controller.reset(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColor.blue,
                  side: const BorderSide(color: AppColor.blue),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Reset',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColor.blue,
      foregroundColor: AppColor.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
