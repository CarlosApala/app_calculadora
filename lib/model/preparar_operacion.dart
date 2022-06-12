import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/model/operaciones_aritmeticas.dart';

import 'calculadora.dart';

class PrepararOperacion extends OperacionesAritmeticas {
  double? numerador;
  double? multiplicador;
  double? resultado;
  TipoOperador? op;
  bool? endOperation;
  bool? point;
  PrepararOperacion(
      {required this.point,
      required this.endOperation,
      required this.numerador,
      required this.multiplicador,
      required this.op,
      required this.resultado});

  double _operacion() {
    switch (op!) {
      case TipoOperador.multi:
        return mulitplicacion(numerador!, multiplicador!);
      case TipoOperador.divi:
        return division(numerador!, multiplicador!);
      case TipoOperador.suma:
        return suma(numerador!, multiplicador!);
      case TipoOperador.resta:
        return resta(numerador!, multiplicador!);
      case TipoOperador.add:
        return numerador!;
      case TipoOperador.igual:
        // TODO: Handle this case.
        break;
      case TipoOperador.point:
        // TODO: Handle this case.
        break;
    }
    return 0;
  }

  @override
  bool isReadyToTrade() {
    return true;
  }

  @override
  void modifyValues({required TipoOperador? definir}) {
    /* if (op == TipoOperador.add &&
          (definir.operador == TipoOperador.divi ||
              definir.operador == TipoOperador.suma ||
              definir.operador == TipoOperador.resta ||
              definir.operador == TipoOperador.multi)) {
        if (numerador == null &&
            multiplicador == null &&
            op == TipoOperador.add) {
          return;
        }
        multiplicador = numerador;
        numerador = 0;
        op = definir.operador;
        return;
      }
      if (definir.operador == TipoOperador.resta && numerador == 0.0) {
        return;
      }
    } */
  }

  @override
  void addNumero(String numero) {}

  @override
  void deleteElementOperation() {
    /* if (numerador != "") {
      numerador = numerador!.substring(0, numerador!.length - 1);
    } else if (numerador == "") {
      op = TipoOperador.add;
      numerador = multiplicador;
      multiplicador = "";
    } */
  }
}
