import 'package:flutter/material.dart';
import 'package:flutter_56/core/base_widget/custom_app_bar_widget.dart';
import 'package:flutter_56/core/base_widget/custom_button_widget.dart';
import 'package:flutter_56/core/base_widget/custom_text_form_filed.dart';
import 'package:flutter_56/core/helper/spacing.dart';
import 'package:flutter_56/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit()..getUser(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: const CustomAppBarWidget(
              title: "Profile Screen",
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: cubit.formKeyProfile,
                child: Column(
                  children: [
                    verticleSpace(10),
                    CustomTextFormFiled(
                      prefixIcon: const Icon(Icons.person_pin_outlined),
                      controller: cubit.nameControllerProfile,
                      hintText: "Name",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Filed is Required";
                        }
                      },
                    ),
                    verticleSpace(10),
                    CustomTextFormFiled(
                      prefixIcon: const Icon(Icons.phone_android_outlined),
                      controller: cubit.phoneControllerProfile,
                      hintText: "Phone",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Filed is Required";
                        }
                      },
                    ),
                    verticleSpace(10),
                    CustomTextFormFiled(
                      prefixIcon: const Icon(Icons.email_outlined),
                      controller: cubit.emailControllerProfile,
                      hintText: "Email",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Filed is Required";
                        }
                      },
                    ),
                    verticleSpace(40),
                    CustomButtonWidget(
                      loading: state is RegisterLoadingState,
                      text: 'Update',
                      function: () {
                        if (cubit.formKeyProfile.currentState!.validate()) {
                          cubit.updateUser();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
