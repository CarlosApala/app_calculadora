import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistorialCalculadora extends StatefulWidget {
  HistorialCalculadora({Key? key}) : super(key: key);

  @override
  State<HistorialCalculadora> createState() => _HistorialCalculadoraState();
}

class _HistorialCalculadoraState extends State<HistorialCalculadora> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int index = 0;
    List<String> lista = [];
    return BlocBuilder<AddnumeroBloc, AddnumeroState>(builder: (_, state) {
      return Expanded(
          child: Container(
        color: const Color.fromARGB(255, 8, 33, 48),
        child: ListView(reverse: false, children: [
          ...state.calculadora.historial!.map((e) {
            index++;
            lista.add(e);
            return Container(
              padding: const EdgeInsets.only(right: 20, bottom: 5),
              alignment: Alignment.centerRight,
              child: Dismissible(
                  onDismissed: (direction) {
                    setState(() {
                      state.calculadora.historial!.removeAt(index - 1);
                    });
                  },
                  key: UniqueKey(),
                  child: Text(
                    e,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(255, 255, 255, 0.4)),
                  )),
            );
          })
        ]),
      ));
    });
  }
}
