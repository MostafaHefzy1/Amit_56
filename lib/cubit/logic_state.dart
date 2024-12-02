part of 'logic_cubit.dart';

@immutable
sealed class LogicState {}

final class LogicInitial extends LogicState {}

final class RegisterFailedState extends LogicState {}

final class LoginLoadingState extends LogicState {}
final class LoginSuccessState extends LogicState {}
final class LoginFailedState extends LogicState {}

final class RegisterLoadingState extends LogicState {}
final class RegisterSuccessState extends LogicState {}
final class EmitEmailLoginController extends LogicState {}




final class GetUserSuccessState extends LogicState {}
final class GetUserFailedState extends LogicState {}


final class UpdateUserSuccessState extends LogicState {}
final class UpdateUserFailedState extends LogicState {}