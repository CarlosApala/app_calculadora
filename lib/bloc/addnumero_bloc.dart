import 'dart:convert';

import 'package:app_calculadora/model/calculadora.dart';
import 'package:app_calculadora/model/preparar_operacion.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'addnumero_event.dart';
part 'addnumero_state.dart';

class AddnumeroBloc extends Bloc<AddnumeroEvent, AddnumeroState> {
  Calculadora calculadora = Calculadora(
      historial: [],
      multiplicador: "",
      numerador: "",
      operacionVisual: "",
      operador: TipoOperador.add,
      point: false,
      residuo: "",
      resultado: "");
  AddnumeroBloc()
      : super(CalculatorInitialState(
            lc: Calculadora(
                historial: [],
                multiplicador: "",
                numerador: "",
                operacionVisual: "",
                operador: TipoOperador.add,
                point: false,
                residuo: "",
                resultado: ""))) {
    on<SetNumeroEvent>((event, emit) {
      final cal = state.calculadora;
      calculadora.copyWith(
          historial: cal.historial,
          multiplicador: cal.multiplicador,
          numerador: cal.numerador,
          operacionVisual: cal.operacionVisual,
          operador: cal.operador,
          point: cal.point,
          residuo: cal.residuo,
          resultado: cal.resultado);

      calculadora.addNumero(event.valor);

      emit(CalculatorInitialState(lc: calculadora));
    });
    on<DefinirOperacion>((event, emit) {
      calculadora.modifyValues(definir: event.operador);
      emit(CalculatorInitialState(lc: calculadora));
    });
    on<DeleteElemetEvent>((event, emit) {});
    on<RealizarOperacion>((event, emit) {
      final cal = state.calculadora;

      calculadora.operador = cal.operador;
      calculadora.RealizarOperacion();
      emit(CalculatorInitialState(lc: calculadora));
    });
    on<DeleteNumeroEvent>((event, emit) {});
  }
}
