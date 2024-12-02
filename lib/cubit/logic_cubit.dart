import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_56/core/network/local/shared_preference.dart';
import 'package:flutter_56/models/user_model.dart';
import 'package:flutter_56/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  var formKeyLogin = GlobalKey<FormState>();

  void loginFirebase(context) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailLoginController.text,
            password: passwordLoginController.text)
        .then((value) {
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  void emitEmailLoginController() {
    emailControllerRegister = emailLoginController;
    emit(EmitEmailLoginController());
  }

  var formKeyRegister = GlobalKey<FormState>();
  TextEditingController nameControllerRegister = TextEditingController();
  TextEditingController phoneControllerRegister = TextEditingController();
  TextEditingController emailControllerRegister = TextEditingController();
  TextEditingController passwordControllerRegister = TextEditingController();

  UserModel? userModel;
  var formKeyProfile = GlobalKey<FormState>();
  TextEditingController nameControllerProfile = TextEditingController();
  TextEditingController phoneControllerProfile = TextEditingController();
  TextEditingController emailControllerProfile = TextEditingController();

  void getUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(SharedPreferenceHelper.getData(key: "uidUser"))
        .get()
        .then((value) {
      userModel = UserModel.formJson(value.data() as Map<String, dynamic>);
      nameControllerProfile.text = userModel?.name ?? "";
      phoneControllerProfile.text = userModel?.phone ?? "";
      emailControllerProfile.text = userModel?.email ?? "";

      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserFailedState());
    });
  }


  // List<UserModel >listUserModel = [] ; 
  // void getAllUser() async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .where("docId", isNotEqualTo: "07wOJdmpx1eo8ceCUZ3bbsAmTpu1")
  //       .get().then((value){
  //         for(int i = 0 ; i<value.docs.length; i++){
  //           listUserModel.add(UserModel.formJson(value.docs[i].data()));
  //           print(value.docs[i].data());
  //         }
  //         print("dsadas ${listUserModel.first.email}");
  //       }).catchError((error){});
  // }

  void updateUser() async {
    UserModel userModel = UserModel(
        name: nameControllerProfile.text,
        phone: phoneControllerProfile.text,
        email: emailControllerProfile.text,
        docId: SharedPreferenceHelper.getData(key: "uidUser"));
    await FirebaseFirestore.instance
        .collection("users")
        .doc(SharedPreferenceHelper.getData(key: "uidUser"))
        .update(userModel.toJson())
        .then((value) {
      emit(UpdateUserSuccessState());
    }).catchError((error) {
      emit(UpdateUserFailedState());
    });
  }

  void registerFirebase(context) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailControllerRegister.text,
            password: passwordControllerRegister.text)
        .then((value) {
      setUser(value.user!.uid);
      SharedPreferenceHelper.saveData(key: "uidUser", value: value.user!.uid);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => ProfileScreen()));
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterFailedState());
    });
  }

  void setUser(String docId) async {
    UserModel userModel = UserModel(
        name: nameControllerRegister.text,
        phone: phoneControllerRegister.text,
        email: emailControllerRegister.text,
        docId: docId);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(docId)
        .set(userModel.toJson());
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
