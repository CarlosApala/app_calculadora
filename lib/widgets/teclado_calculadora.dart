import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/model/calculadora.dart';
import 'package:app_calculadora/widgets/boton_calculadora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TecladoCalculadora extends StatelessWidget {
  TecladoCalculadora({Key? key}) : super(key: key);
  final TextStyle style = TextStyle(color: Color.fromRGBO(109, 255, 242, 1));
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddnumeroBloc, AddnumeroState>(
        builder: (context, state) {
      return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Color.fromRGBO(5, 21, 30, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BotonCalculador(
                    numero: "BORRAR",
                    evento: DeleteNumeroEvent(),
                    style: TextStyle(color: Colors.orange)),
                BotonCalculador(numero: "+/-", style: style),
                BotonCalculador(
                  numero: "°/.",
                  style: style,
                ),
                BotonCalculador(
                  numero: "div",
                  style: style,
                  evento: DefinirOperacion(operador: TipoOperador.divi),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BotonCalculador(
                  numero: "7",
                  style: style,
                  evento: SetNumeroEvent(valor: "7"),
                ),
                BotonCalculador(
                  numero: "8",
                  style: style,
                  evento: SetNumeroEvent(valor: "8"),
                ),
                BotonCalculador(
                  numero: "9",
                  style: style,
                  evento: SetNumeroEvent(valor: "9"),
                ),
                BotonCalculador(
                  numero: "mult",
                  style: style,
                  evento: DefinirOperacion(operador: TipoOperador.multi),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonCalculador(
                  numero: "4",
                  style: style,
                  evento: SetNumeroEvent(valor: "4"),
                ),
                BotonCalculador(
                  numero: "5",
                  style: style,
                  evento: SetNumeroEvent(valor: "5"),
                ),
                BotonCalculador(
                  numero: "6",
                  style: style,
                  evento: SetNumeroEvent(valor: "6"),
                ),
                BotonCalculador(
                    numero: "rest",
                    style: style,
                    evento: DefinirOperacion(operador: TipoOperador.resta)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonCalculador(
                  numero: "1",
                  style: style,
                  evento: SetNumeroEvent(valor: "1"),
                ),
                BotonCalculador(
                  numero: "2",
                  style: style,
                  evento: SetNumeroEvent(valor: "2"),
                ),
                BotonCalculador(
                  numero: "3",
                  style: style,
                  evento: SetNumeroEvent(valor: "3"),
                ),
                BotonCalculador(
                    numero: "suma",
                    style: style,
                    evento: DefinirOperacion(operador: TipoOperador.suma))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonCalculador(
                  numero: ".",
                  style: style,
                  evento: SetNumeroEvent(valor: "."),
                ),
                BotonCalculador(
                  numero: "0",
                  style: style,
                  evento: SetNumeroEvent(valor: "0"),
                ),
                BotonCalculador(
                  icono: const Icon(Icons.backspace_outlined,
                      color: Color.fromRGBO(109, 255, 242, 1)),
                  evento: RetrocederNumeroEvent(),
                ),
                BotonCalculador(
                  numero: "=",
                  evento: RealizarOperacionEvent(),
                  style: const TextStyle(
                      fontSize: 28, color: Color.fromRGBO(109, 255, 242, 1)),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
