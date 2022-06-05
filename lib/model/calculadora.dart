enum TipoOperador { multi, divi, suma, resta, add, igual, point }

class Calculadora {
  final double? numerador;
  final double? multiplicador;
  final double? residuo;
  final double? resultado;
  final TipoOperador? operador;
  final String? operacionVisual;
  final bool? point;
  final List<String>? historial;

  Calculadora(
      {this.resultado,
      this.operador,
      this.numerador,
      this.point,
      this.multiplicador,
      this.residuo,
      this.operacionVisual,
      this.historial});

  Calculadora copyWith(
      {TipoOperador? operador,
      double? resultado,
      double? numerador,
      double? multiplicador,
      double? residuo,
      String? operacionVisual,
      bool? point,
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
        point: point ?? point,
        historial: historial ?? this.historial,
        multiplicador: multiplicador ?? this.multiplicador,
        numerador: numerador ?? this.numerador,
        operador: operador ?? this.operador,
        residuo: residuo ?? this.residuo,
        resultado: resultado ?? this.resultado,
        operacionVisual: operacionVisual ?? this.operacionVisual);
  }
}
