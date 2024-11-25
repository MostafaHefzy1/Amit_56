part of 'logic_cubit.dart';

@immutable
sealed class LogicState {}

final class LogicInitial extends LogicState {}


final class LoginSuccessState extends LogicState {}
final class LoginFailedState extends LogicState {}