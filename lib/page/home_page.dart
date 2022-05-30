import 'package:app_calculadora/widgets/historial_calculadora.dart';
import 'package:app_calculadora/widgets/operacion_calculadora.dart';
import 'package:app_calculadora/widgets/resultado_calculadora.dart';
import 'package:app_calculadora/widgets/teclado_calculadora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/addnumero_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int valor = 0;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<AddnumeroBloc, AddnumeroState>(
        builder: (_, state) {
          return SafeArea(
            child: Column(
              children: const [
                HistorialCalculadora(),
                OperacionCalculadora(),
                ResultadoCalculadora(),
                TecladoCalculadora(),
              ],
            ),
          );
        },
      ),
    );
  }
}
