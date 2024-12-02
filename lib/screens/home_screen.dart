// import 'package:firebase_test/core/base_widget/custom_app_bar_widget.dart';
// import 'package:firebase_test/core/base_widget/custom_button_widget.dart';
// import 'package:firebase_test/core/base_widget/custom_text_form_filed.dart';
// import 'package:firebase_test/core/helper/spacing.dart';
// import 'package:firebase_test/cubit/logic_cubit.dart';
// import 'package:firebase_test/screens/login_screen.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_56/cubit/logic_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LogicCubit()..getAllUsers(),
//       child: BlocBuilder<LogicCubit, LogicState>(
//         builder: (context, state) {
//           var cubit = LogicCubit.get(context);
//           return Scaffold(
//             appBar: const CustomAppBarWidget(
//               title: "Home Screen",
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Form(
//                 key: cubit.formKeyRegister,
//                 child: Column(
//                   children: [
//                     verticleSpace(10),
//                     CustomTextFormFiled(
//                       prefixIcon: const Icon(Icons.person_pin_outlined),
//                       controller: cubit.nameControllerUpdate,
//                       hintText: "Name",
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return "This Filed is Required";
//                         }
//                       },
//                     ),
//                     verticleSpace(10),
//                     CustomTextFormFiled(
//                       prefixIcon: const Icon(Icons.phone_android_outlined),
//                       controller: cubit.phoneControllerUpdate,
//                       hintText: "Phone",
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return "This Filed is Required";
//                         }
//                       },
//                     ),
//                     verticleSpace(10),
//                     CustomTextFormFiled(
//                       prefixIcon: const Icon(Icons.email_outlined),
//                       controller: cubit.emailControllerUpdate,
//                       hintText: "Email",
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return "This Filed is Required";
//                         }
//                       },
//                     ),
//                     verticleSpace(40),
//                     CustomButtonWidget(
//                       loading: state is UpdateLoadingState,
//                       text: 'Update Profile',
//                       function: () {
//                         cubit.updateUSer();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
