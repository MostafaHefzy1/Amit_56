part of 'logic_cubit.dart';

@immutable
sealed class LogicState {}

final class LogicInitial extends LogicState {}

final class LoginSuccessState extends LogicState {}

final class LoginFailedState extends LogicState {}

final class GetNewsSuccess extends LogicState {
  final NewsModel newsModel;

  GetNewsSuccess(this.newsModel);
}

final class GetNewsError extends LogicState {}


final class ChangeLangState extends LogicState {}