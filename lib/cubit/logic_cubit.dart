import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_56/dio_helper.dart';
import 'package:flutter_56/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) => BlocProvider.of(context);

  void getDataWithQuery(String lang) async {
    await DioHelper.getData(endPoint: "everything", queryParameters: {
      "language": lang,
      "q": "science",
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      emit(GetNewsSuccess(NewsModel.fromJson(value.data)));
    }).catchError((error) {
      emit(GetNewsError());
    });
  }

  bool lang = true; // if lang true  = "en"
  void changeLang() {
    lang = !lang;
    if (lang) {
      getDataWithQuery("en");
    } else {
      getDataWithQuery("ar");
    }
    emit(ChangeLangState()) ; 
  }
}
