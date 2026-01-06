import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/calculator_bloc.dart';
import 'pages/calculator_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculatorPage2(),
      ),
    );
  }
}
