import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/model/operaciones_aritmeticas.dart';

import 'calculadora.dart';

class PrepararOperacion extends OperacionesAritmeticas {
  String? numerador;
  String? multiplicador;
  String? resultado;
  TipoOperador? op;
  bool? endOperation;
  PrepararOperacion(
      {required this.endOperation,
      required this.numerador,
      required this.multiplicador,
      required this.op,
      required this.resultado});

  double _operacion() {
    switch (op!) {
      case TipoOperador.multi:
        return mulitplicacion(
            double.parse(numerador!), double.parse(multiplicador!));
      case TipoOperador.divi:
        return division(double.parse(numerador!), double.parse(multiplicador!));
      case TipoOperador.suma:
        return suma(
            numerador!.contains(".") ? numerador! : numerador! + ".0",
            multiplicador!.contains(".")
                ? multiplicador!
                : multiplicador! + ".0");

      case TipoOperador.resta:
        return resta(double.parse(numerador!), double.parse(multiplicador!));

      case TipoOperador.add:
        return double.parse(multiplicador!);
      case TipoOperador.igual:
        // TODO: Handle this case.
        break;
    }
    return 0;
  }

  @override
  bool isReadyToTrade() {
    // TODO: implement isReadyToTrade
    return true;
  }

  @override
  void modifyValues({SetNumeroEvent? setevent, DefinirOperacion? definir}) {
    print(0.8 * 0.001);
    if (!endOperation!) {
      if (setevent != null) {
        if (multiplicador != "" && op != TipoOperador.add) {
          if (numerador!.contains(".") && setevent.valor == ".") {
            return;
          } else if (setevent.valor == "." && numerador!.isEmpty) {
            return;
          } else if (setevent.valor == "." && numerador!.isNotEmpty) {
            numerador = numerador! + setevent.valor;
            return;
          }

          numerador = numerador! + setevent.valor;
          resultado = _operacion().toString();
          return;
        }
        if (multiplicador == "" && op == TipoOperador.add) {
          if (setevent.valor == "." && numerador!.contains(".")) {
            return;
          }
          if (setevent.valor == "." && numerador!.isEmpty) {
            numerador = "0.";
            return;
          }
          numerador = numerador! + setevent.valor;
          return;
        }
      }
      if (definir != null) {
        if (op != TipoOperador.add && definir.operador != TipoOperador.add) {
          resultado = _operacion().toString();
          multiplicador = resultado;
          numerador = "";
          op = definir.operador;
          return;
        }
        if (op == TipoOperador.add &&
            (definir.operador == TipoOperador.divi ||
                definir.operador == TipoOperador.suma ||
                definir.operador == TipoOperador.resta ||
                definir.operador == TipoOperador.multi)) {
          if (numerador == "" &&
              multiplicador == "" &&
              op == TipoOperador.add) {
            return;
          }
          multiplicador = numerador;
          numerador = "";
          op = definir.operador;
          return;
        }
        if (definir.operador == TipoOperador.resta && numerador == "") {
          numerador = "-";
        }
      }
    } else if (endOperation!) {
      if (multiplicador != "" && numerador != "" && op != TipoOperador.add) {
        resultado = _operacion().toString();
        numerador = "";
        multiplicador = "";
        op = TipoOperador.add;
        return;
      }
    }
  }

  //condicionales para que la operacion se realize correctamente
  /* @override
  void modifyValues(TipoOperador operaActual) {
    if (numerador == "" &&
        multiplicador == "" &&
        resultado == "" &&
        operaActual != TipoOperador.add) {
      print("paso por aqui");
      return;
    }
    if (multiplicador != "" &&
        numerador == "" &&
        operaActual != TipoOperador.add) {
      op = operaActual;
      return;
    }
    if (resultado != "" &&
        numerador == "" &&
        operaActual != TipoOperador.igual) {
      multiplicador = resultado;
      op = operaActual;
      numerador = "";
      return;
    }

    if (resultado != "" && operaActual == TipoOperador.resta) {
      print("3e");
      multiplicador = "-${resultado!}";
      resultado = "";
      op = TipoOperador.add;
      return;
    }

    if (multiplicador != "" &&
        numerador != "" &&
        (operaActual == TipoOperador.igual ||
            operaActual == TipoOperador.divi ||
            operaActual == TipoOperador.multi ||
            operaActual == TipoOperador.resta ||
            operaActual == TipoOperador.suma)) {
      resultado = _operacion().toString();
      if (op != operaActual && operaActual != TipoOperador.igual) {
        op = operaActual;
        multiplicador = resultado;
        numerador = "";
      } else {}

      return;
    }
    if (multiplicador == "" &&
        numerador != "" &&
        op == TipoOperador.add &&
        operaActual != TipoOperador.add &&
        operaActual != TipoOperador.igual) {
      multiplicador = numerador;
      numerador = "";
      op = operaActual;
      return;
    }
    if (multiplicador != "" &&
        numerador != "" &&
        op != TipoOperador.add &&
        operaActual != TipoOperador.igual) {
      resultado = _operacion().toString();
      multiplicador = resultado;
      op = operaActual;
      numerador = "";
    }
  } */

  @override
  void addNumero(String numero) {
    if (resultado != "" &&
        multiplicador != "" &&
        numerador != "" &&
        op != TipoOperador.add) {
      multiplicador = "";
      numerador = "";
      op = TipoOperador.add;
    }
    numerador = numerador! + numero;
  }

  @override
  void deleteElementOperation() {
    if (numerador != "") {
      numerador = numerador!.substring(0, numerador!.length - 1);
    } else if (numerador == "") {
      op = TipoOperador.add;
      numerador = multiplicador;
      multiplicador = "";
    }
  }
}
