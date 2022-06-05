import 'dart:convert';

import 'package:app_calculadora/model/calculadora.dart';
import 'package:app_calculadora/model/preparar_operacion.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'addnumero_event.dart';
part 'addnumero_state.dart';

class AddnumeroBloc extends Bloc<AddnumeroEvent, AddnumeroState> {
  AddnumeroBloc()
      : super(CalculatorInitialState(
            lc: Calculadora(
                point: false,
                multiplicador: 0,
                numerador: 0,
                operador: TipoOperador.add,
                operacionVisual: "",
                residuo: 0,
                historial: [],
                resultado: 0))) {
    on<SetNumeroEvent>((event, emit) {
      PrepararOperacion pr = PrepararOperacion(
          point: state.calculadora.point,
          endOperation: false,
          numerador: state.calculadora.numerador,
          multiplicador: state.calculadora.multiplicador,
          op: state.calculadora.operador,
          resultado: state.calculadora.resultado);
      //pr.modifyValues(setevent: event);
      pr.addNumero(event.valor);
      //pr.modifyValues(TipoOperador.add);
      emit(CalculatorInitialState(
          lc: state.calculadora.copyWith(
              resultado: pr.resultado,
              operador: pr.op,
              numerador: pr.numerador,
              multiplicador: pr.multiplicador)));
    });
    on<DefinirOperacion>((event, emit) {
      PrepararOperacion pr = PrepararOperacion(
          endOperation: false,
          point: state.calculadora.point,
          numerador: state.calculadora.numerador,
          multiplicador: state.calculadora.multiplicador,
          op: state.calculadora.operador,
          resultado: state.calculadora.resultado);

      pr.modifyValues(definir: event);
      //pr.modifyValues(TipoOperador.add);
      emit(CalculatorInitialState(
          lc: state.calculadora.copyWith(
              resultado: pr.resultado,
              operador: pr.op,
              numerador: pr.numerador,
              multiplicador: pr.multiplicador)));
    });
    on<DeleteElemetEvent>((event, emit) {
      PrepararOperacion pr = PrepararOperacion(
          endOperation: false,
          point: state.calculadora.point,
          numerador: state.calculadora.numerador!,
          multiplicador: state.calculadora.multiplicador!,
          op: state.calculadora.operador,
          resultado: state.calculadora.resultado!);
      pr.deleteElementOperation();

      emit(CalculatorInitialState(
          lc: state.calculadora.copyWith(
              resultado: pr.resultado,
              multiplicador: pr.multiplicador,
              operador: pr.op,
              numerador: pr.numerador)));
    });
    on<RealizarOperacion>((event, emit) {
      PrepararOperacion pr = PrepararOperacion(
          endOperation: true,
          point: state.calculadora.point,
          numerador: state.calculadora.numerador!,
          multiplicador: state.calculadora.multiplicador,
          op: state.calculadora.operador,
          resultado: state.calculadora.resultado!);
      emit(CalculatorInitialState(
          lc: state.calculadora.copyWith(
              numerador: pr.numerador,
              multiplicador: pr.multiplicador,
              operador: pr.op,
              resultado: pr.resultado)));
    });
    on<DeleteNumeroEvent>((event, emit) {
      emit(CalculatorInitialState(
          lc: Calculadora(
              multiplicador: 0,
              numerador: 0,
              operacionVisual: null,
              operador: TipoOperador.add,
              residuo: 0,
              historial: [],
              resultado: 0)));
    });
  }
}
