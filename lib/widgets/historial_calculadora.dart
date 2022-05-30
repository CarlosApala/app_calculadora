import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistorialCalculadora extends StatelessWidget {
  const HistorialCalculadora({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AddnumeroBloc, AddnumeroState>(builder: (_, state) {
      return Expanded(
          child: Container(
        color: Color.fromRGBO(23, 23, 28, 1),
        child: ListView(children: [
          ...state.calculadora.historial!.map((e) => Container(
                padding: const EdgeInsets.only(right: 20, bottom: 5),
                alignment: Alignment.centerRight,
                child: Text(
                  e,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromRGBO(255, 255, 255, 0.4)),
                ),
              ))
        ]),
      ));
    });
  }
}
