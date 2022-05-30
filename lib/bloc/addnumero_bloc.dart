import 'package:app_calculadora/model/calculadora.dart';
import 'package:app_calculadora/model/operaciones_aritmeticas.dart';
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
      String num = state.calculadora.numerador! + event.valor;

      String operacion = state.calculadora.operador != TipoOperador.add
          ? OperacionesAritmeticas(op: state.calculadora.operador!)
              .operacion(double.parse(num),
                  double.parse(state.calculadora.multiplicador!))
              .toString()
          : "";
      print(state.calculadora.operador);
      print(num);
      emit(CalculatorInitialState(
          lc: state.calculadora
              .copyWith(numerador: num, resultado: operacion)));
    });
    on<DefinirOperacion>((event, emit) {
      String operacion = state.calculadora.resultado == ""
          ? ""
          : OperacionesAritmeticas(op: state.calculadora.operador!)
              .operacion(
                  event.operador == TipoOperador.multi ||
                          event.operador == TipoOperador.divi
                      ? double.parse("1.0")
                      : double.parse("0.0"),
                  double.parse(state.calculadora.resultado!))
              .toString();
      print(operacion);
      print(event.operador);
      if (operacion == "") {
        emit(CalculatorInitialState(
            lc: state.calculadora.copyWith(
                multiplicador: state.calculadora.numerador != ""
                    ? state.calculadora.numerador
                    : state.calculadora.multiplicador,
                numerador: operacion,
                resultado: state.calculadora.numerador,
                operador: event.operador)));
      } else {
        if (event.operador == TipoOperador.add) {
          emit(CalculatorInitialState(
              lc: state.calculadora.copyWith(
                  multiplicador: "",
                  numerador: operacion,
                  resultado: "",
                  operador: TipoOperador.add)));
        } else {
          emit(CalculatorInitialState(
              lc: state.calculadora.copyWith(
                  multiplicador: operacion,
                  numerador: "",
                  resultado: "",
                  historial: [
                    "${state.calculadora.multiplicador} ${state.calculadora.operacionVisual} ${state.calculadora.numerador} = $operacion",
                    ...state.calculadora.historial!
                  ],
                  operador: event.operador)));
        }
      }
    });

    on<RealizarOperacionEvent>((event, emit) {
      String resultado = OperacionesAritmeticas(op: state.calculadora.operador!)
          .operacion(double.parse(state.calculadora.numerador!),
              double.parse(state.calculadora.multiplicador!))
          .toString();
      emit(CalculatorInitialState(
          lc: state.calculadora.copyWith(
              resultado: resultado,
              numerador: "",
              operador: TipoOperador.add,
              multiplicador: "",
              historial: [
            "${state.calculadora.multiplicador} ${state.calculadora.operacionVisual} ${state.calculadora.numerador} = $resultado",
            ...state.calculadora.historial!
          ])));
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

    on<RetrocederNumeroEvent>(((event, emit) {
      emit(CalculatorInitialState(
          lc: state.calculadora.copyWith(
              numerador: state.calculadora.numerador!
                  .substring(0, state.calculadora.numerador!.length - 1))));
    }));
  }
}
