import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperacionCalculadora extends StatelessWidget {
  const OperacionCalculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle st = TextStyle(fontSize: 30, color: Colors.white60);
    return BlocBuilder<AddnumeroBloc, AddnumeroState>(builder: (_, state) {
      return Container(
        height: 40,
        color: Color.fromRGBO(23, 23, 28, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(
                state.calculadora.multiplicador!,
                style: st,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                state.calculadora.operacionVisual!,
                style: state.calculadora.operacionVisual == "-"
                    ? TextStyle(fontSize: 40, color: Colors.white60)
                    : st,
              ),
            ),
            Container(
              child: Text(
                state.calculadora.numerador!,
                style: st,
              ),
            )
          ],
        ),
      );
    });
  }
}
