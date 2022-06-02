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
                multiplicador: "",
                numerador: "",
                operador: TipoOperador.add,
                operacionVisual: "",
                residuo: "",
                historial: [],
                resultado: ""))) {
    on<SetNumeroEvent>((event, emit) {
      PrepararOperacion pr = PrepararOperacion(
          endOperation: false,
          numerador: state.calculadora.numerador,
          multiplicador: state.calculadora.multiplicador,
          op: state.calculadora.operador,
          resultado: state.calculadora.resultado);

      pr.modifyValues(setevent: event);
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
          numerador: state.calculadora.numerador,
          multiplicador: state.calculadora.multiplicador,
          op: state.calculadora.operador,
          resultado: state.calculadora.resultado);
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
          numerador: state.calculadora.numerador,
          multiplicador: state.calculadora.multiplicador,
          op: state.calculadora.operador,
          resultado: state.calculadora.resultado);
      pr.modifyValues();
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
              multiplicador: "",
              numerador: "",
              operacionVisual: "",
              operador: TipoOperador.add,
              residuo: "",
              historial: [],
              resultado: "")));
    });
  }
}
