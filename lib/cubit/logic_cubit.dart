import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_56/dio_helper.dart';
import 'package:flutter_56/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) => BlocProvider.of(context);

  void login({
    required String phone,
    required String password,
  }) async {
    await DioHelper.postData(
        endPoint: "auth/login",
        data: {"phone": phone, "password": password}).then((value) {
      log(value.data["access_token"]);
      emit(LoginSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(LoginFailedState());
    });
  }
}
