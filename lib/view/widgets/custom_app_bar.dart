import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon, this.onPressed}) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text(
          title,
          style: const TextStyle(
          fontSize: 28,
         ),
        ),

        Spacer(),

        CustomIcon(
          onPressed: onPressed ,
          icon: icon ,
        ),
      ],
    );
  }
}

