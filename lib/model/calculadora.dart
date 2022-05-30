import 'package:app_calculadora/model/operaciones_aritmeticas.dart';

enum TipoOperador { multi, divi, suma, resta, igual, add }

class Calculadora extends OperacionesAritmeticas {
  final String? numerador;
  final String? multiplicador;
  final String? residuo;
  final String? resultado;
  final TipoOperador? operador;
  final String? operacionVisual;
  final List<String>? historial;

  Calculadora(
      {this.resultado,
      this.operador,
      this.numerador,
      this.multiplicador,
      this.residuo,
      this.operacionVisual,
      this.historial})
      : super(op: operador!);

  Calculadora copyWith(
      {String? resultado,
      TipoOperador? operador,
      String? numerador,
      String? multiplicador,
      String? residuo,
      String? operacionVisual,
      List<String>? historial}) {
    switch (operador) {
      case TipoOperador.multi:
        operacionVisual = "*";
        break;
      case TipoOperador.divi:
        operacionVisual = "/";
        break;
      case TipoOperador.suma:
        operacionVisual = "+";
        break;
      case TipoOperador.resta:
        operacionVisual = "-";
        break;
      case TipoOperador.igual:
        operacionVisual = "=";
        break;
      case TipoOperador.add:
        operacionVisual = "";
        break;
      default:
        break;
    }
    return Calculadora(
        historial: historial ?? this.historial,
        multiplicador: multiplicador ?? this.multiplicador,
        numerador: numerador ?? this.numerador,
        operador: operador ?? this.operador,
        residuo: residuo ?? this.residuo,
        resultado: resultado ?? this.resultado,
        operacionVisual: operacionVisual ?? this.operacionVisual);
  }
}
