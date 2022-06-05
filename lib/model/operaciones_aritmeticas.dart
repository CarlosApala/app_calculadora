import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/helpers/presicion_numeros.dart';

abstract class OperacionesAritmeticas {
  OperacionesAritmeticas();

  PrecisionNumeros precisionNumeros = PrecisionNumeros(precision: 7);

  void addNumero(double numero);
  void deleteElementOperation();
  void modifyValues({required DefinirOperacion? definir});

  double suma(double numerador, double multiplicador) {
    return numerador + multiplicador;
  }

  double resta(double numerador, double numOperador) {
    return numOperador - numerador;
  }

  double mulitplicacion(double numerador, double numOperador) {
    return numerador * numOperador;
  }

  double division(double numerador, double numOperador) {
    return numOperador / numerador;
  }
}
