import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultadoCalculadora extends StatelessWidget {
  const ResultadoCalculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddnumeroBloc, AddnumeroState>(builder: (_, state) {
      return Container(
        color: const Color.fromRGBO(23, 23, 28, 1),
        alignment: Alignment.centerRight,
        child: Text(
          state.calculadora.residuo != null
              ? "= ${state.calculadora.resultado.toString()}"
              : "=",
          style: const TextStyle(fontSize: 45, color: Colors.white),
        ),
      );
    });
  }
}
