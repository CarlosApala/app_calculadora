import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/helpers/presicion_numeros.dart';

abstract class OperacionesAritmeticas {
  OperacionesAritmeticas();

  PrecisionNumeros precisionNumeros = PrecisionNumeros(precision: 7);

  void addNumero(String numero);
  void deleteElementOperation();
  void modifyValues({SetNumeroEvent? setevent, DefinirOperacion? definir});

  double suma(String numerador, String multiplicador) {
    String numDecimalAux =
        numerador.substring(numerador.indexOf(".") + 1, numerador.length);

    String numEntAux = numerador.substring(0, numerador.indexOf("."));

    String multDecimalAux = multiplicador.substring(
        multiplicador.indexOf(".") + 1, multiplicador.length);

    String multEntAux = multiplicador.substring(0, multiplicador.indexOf("."));

    String totalEnteroAux =
        (double.parse(multEntAux) + double.parse(numEntAux)).toString();

    String totalDecimAux =
        (double.parse(numDecimalAux) + double.parse(multDecimalAux)).toString();
    totalDecimAux =
        "0.${totalDecimAux.substring(0, totalDecimAux.indexOf("."))}";

    return (double.parse(totalEnteroAux) + double.parse(totalDecimAux));
  }

  double resta(double numerador, double numOperador) {
    return precisionNumeros.processPrecision(numOperador - numerador);
  }

  double mulitplicacion(double numerador, double numOperador) {
    return precisionNumeros.processPrecision(numerador * numOperador);
  }

  double division(double numerador, double numOperador) {
    return precisionNumeros.processPrecision(numOperador / numerador);
  }
}
