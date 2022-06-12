import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/model/calculadora.dart';
import 'package:app_calculadora/widgets/boton_calculadora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TecladoCalculadora extends StatelessWidget {
  const TecladoCalculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddnumeroBloc, AddnumeroState>(
        builder: (context, state) {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: const Color.fromRGBO(23, 23, 28, 1),
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
                    style: const TextStyle(color: Colors.orange)),
                const BotonCalculador(numero: "+/-"),
                const BotonCalculador(numero: "°/."),
                BotonCalculador(
                  numero: "div",
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
                  evento: SetNumeroEvent(valor: "7"),
                ),
                BotonCalculador(
                  numero: "8",
                  evento: SetNumeroEvent(valor: "8"),
                ),
                BotonCalculador(
                  numero: "9",
                  evento: SetNumeroEvent(valor: "9"),
                ),
                BotonCalculador(
                  numero: "mult",
                  evento: DefinirOperacion(operador: TipoOperador.multi),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonCalculador(
                  numero: "4",
                  evento: SetNumeroEvent(valor: "4"),
                ),
                BotonCalculador(
                  numero: "5",
                  evento: SetNumeroEvent(valor: "5"),
                ),
                BotonCalculador(
                  numero: "6",
                  evento: SetNumeroEvent(valor: "6"),
                ),
                BotonCalculador(
                    numero: "rest",
                    evento: DefinirOperacion(operador: TipoOperador.resta)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonCalculador(
                  numero: "1",
                  evento: SetNumeroEvent(valor: "1"),
                ),
                BotonCalculador(
                  numero: "2",
                  evento: SetNumeroEvent(valor: "2"),
                ),
                BotonCalculador(
                  numero: "3",
                  evento: SetNumeroEvent(valor: "3"),
                ),
                BotonCalculador(
                    numero: "suma",
                    evento: DefinirOperacion(operador: TipoOperador.suma))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonCalculador(
                  numero: ".",
                  evento: DefinirOperacion(operador: TipoOperador.point),
                ),
                BotonCalculador(
                  numero: "0",
                  evento: SetNumeroEvent(valor: "0"),
                ),
                BotonCalculador(
                  icono: const Icon(Icons.backspace_outlined),
                  evento: DeleteElemetEvent(),
                ),
                BotonCalculador(
                  numero: "=",
                  evento: RealizarOperacion(),
                  style: const TextStyle(fontSize: 28),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
