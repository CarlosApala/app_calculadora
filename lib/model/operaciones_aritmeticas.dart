import 'package:app_calculadora/helpers/presicion_numeros.dart';
import 'package:app_calculadora/model/calculadora.dart';

class OperacionesAritmeticas {
  final TipoOperador op;
  OperacionesAritmeticas({required this.op});
  PrecisionNumeros precisionNumeros = PrecisionNumeros(precision: 7);

  double operacion(dynamic numerador, dynamic numOperador) {
    switch (op) {
      case TipoOperador.multi:
        return mulitplicacion(numerador, numOperador);
      case TipoOperador.divi:
        return division(numerador, numOperador);
      case TipoOperador.suma:
        return suma(numerador, numOperador);

      case TipoOperador.resta:
        return resta(numerador, numOperador);

      case TipoOperador.igual:
        // TODO: Handle this case.
        break;
      case TipoOperador.add:
        return numOperador;
    }
    return 0;
  }

  double suma(double numerador, double numOperador) {
    return precisionNumeros.processPrecision(numerador + numOperador);
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
