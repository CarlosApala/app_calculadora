part of 'addnumero_bloc.dart';

@immutable
abstract class AddnumeroState {
  final Calculadora calculadora;
  const AddnumeroState({required this.calculadora});
}

class CalculatorInitialState extends AddnumeroState {
  final Calculadora lc;
  const CalculatorInitialState({required this.lc}) : super(calculadora: lc);
}
