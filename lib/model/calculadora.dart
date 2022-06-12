import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/model/operaciones_aritmeticas.dart';

enum TipoOperador { multi, divi, suma, resta, add, igual, point }

class Calculadora extends OperacionesAritmeticas {
  String? numerador;
  String? multiplicador;
  String? residuo;
  String? resultado;
  TipoOperador? operador;
  String? operacionVisual;
  bool? point;
  List<String>? historial;

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
      String? resultado,
      String? numerador,
      String? multiplicador,
      String? residuo,
      String? operacionVisual,
      bool? point,
      List<String>? historial}) {
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

  void RealizarOperacion() {
    resultado = _operacion();
    numerador = "";
    multiplicador = "";
    operador = TipoOperador.add;
    operacionVisual = "";
  }

  String _operacion() {
    switch (operador!) {
      case TipoOperador.multi:
        return mulitplicacion(
                double.parse(numerador!), double.parse(multiplicador!))
            .toString();
      case TipoOperador.divi:
        return division(double.parse(numerador!), double.parse(multiplicador!))
            .toString();
      case TipoOperador.suma:
        return suma(double.parse(numerador!), double.parse(multiplicador!))
            .toString();
      case TipoOperador.resta:
        return resta(double.parse(numerador!), double.parse(multiplicador!))
            .toString();
      case TipoOperador.add:
        return numerador!;
      case TipoOperador.igual:
        // TODO: Handle this case.
        break;
      case TipoOperador.point:
        // TODO: Handle this case.
        break;
    }
    return "";
  }

  @override
  void addNumero(String numero) {
    numerador = numerador! + numero;
  }

  @override
  void deleteElementOperation() {
    // TODO: implement deleteElementOperation
  }

  @override
  void modifyValues({required TipoOperador? definir}) {
    opVisual(definir!);
    multiplicador = numerador;
    numerador = "";
  }

  void opVisual(TipoOperador ds) {
    switch (ds) {
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
  }
}
