import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool isBack;

  const CustomAppBarWidget({super.key, this.title, this.isBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 5,
        backgroundColor: Colors.brown,
        title: Text(
          title ?? "",
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: isBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ))
            : const SizedBox());
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
