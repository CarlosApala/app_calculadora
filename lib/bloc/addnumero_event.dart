part of 'addnumero_bloc.dart';

@immutable
abstract class AddnumeroEvent {}

class SetNumeroEvent extends AddnumeroEvent {
  final String valor;

  SetNumeroEvent({required this.valor});
}

class DefinirOperacion extends AddnumeroEvent {
  final TipoOperador operador;
  DefinirOperacion({required this.operador});
}

class RealizarOperacionEvent extends AddnumeroEvent {}

class RetrocederNumeroEvent extends AddnumeroEvent {}

class DeleteNumeroEvent extends AddnumeroEvent {}
