part of 'addnumero_bloc.dart';

@immutable
abstract class AddnumeroEvent {}

class SetNumeroEvent extends AddnumeroEvent {
  final double valor;

  SetNumeroEvent({required this.valor});
}

class DefinirOperacion extends AddnumeroEvent {
  final TipoOperador operador;
  DefinirOperacion({required this.operador});
}

class RealizarOperacion extends AddnumeroEvent {}

class DeleteElemetEvent extends AddnumeroEvent {}

class DeleteNumeroEvent extends AddnumeroEvent {}
