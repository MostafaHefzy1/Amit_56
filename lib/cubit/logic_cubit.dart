import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_56/dio_helper.dart';
import 'package:flutter_56/news_model.dart';
import 'package:flutter_56/news_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) => BlocProvider.of(context);

  void getDataWithQuery(String lang) async {
    await DioHelper.getData(endPoint: "everything", queryParameters: {
      "language": lang,
      "q": "business",
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
    emit(ChangeLangState());
  }

  void createAccountFirebase(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(CreateAccountSuccessState());
    }).catchError((error) {
      emit(CreateAccountFailedState());
    });
  }

  void loginFirebase(
      {required String email,
      required String password,
      required BuildContext context}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      
      Navigator.push(context, MaterialPageRoute(builder: (_) => NewsScreen()));
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  void forgetPassword({required String email}) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      emit(ChangePasswordAccountSuccessState());
    }).catchError((error) {
      emit(ChangePasswordAccountFailedState());
    });
  }

  // void googleSignIn() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
  //     emit(GoogleSignInSuccessState());
  //   }).catchError((error) {
  //     emit(GoogleSignInFailedState());
  //   });
  // }
  
}
