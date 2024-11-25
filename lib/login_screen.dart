import 'package:flutter/material.dart';
import 'package:flutter_56/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text(
                "Login Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        print("value $value");
                        if (value!.isEmpty) {
                          return "error";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Emails",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Pass",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                                phone: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        child: const Text("data"))
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
