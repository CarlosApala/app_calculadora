import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/model/calculadora.dart';
import 'package:app_calculadora/model/purificarDouble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BotonCalculador extends StatelessWidget {
  final String? numero;
  final Icon? icono;
  final AddnumeroEvent? evento;
  final TextStyle? style;
  const BotonCalculador(
      {Key? key, this.numero = "", this.icono, this.evento, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 5,
      margin: const EdgeInsets.all(5),
      width: size.width / 5,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith((states) =>
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24))),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color.fromRGBO(46, 47, 56, 1)),
              padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(10))),
          onPressed: evento == null
              ? () {}
              : () {
                  BlocProvider.of<AddnumeroBloc>(context).add(evento!);
                  PurifcarDouble pur = PurifcarDouble();
                  //pur.purificar("321.45", "3.15");
                  pur.sustraerElement("54.34", ".");
                },
          child: numero != ""
              ? Text(
                  numero!,
                  style: style,
                )
              : icono),
      //const Icon(Icons.backspace_outlined)),
    );
  }
}
