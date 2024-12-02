import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String hintText;
  final Function? onChange;
  const CustomTextFormFiled(
      {super.key,
      required this.controller,
      this.onChange,
      required this.iconData,
      required this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => onChange!(value),
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
