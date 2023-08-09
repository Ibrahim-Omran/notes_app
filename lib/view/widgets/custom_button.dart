
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap,this.isLoading = false}) : super(key: key);

   final void Function()? onTap;
   final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // كدا انااديته العرض بتاع الاسكرينة بالكامل
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),

        ),
        child:  Center(
          child: isLoading ?
          const SizedBox(
            height: 24,
            width: 24,
            child:  CircularProgressIndicator(
              color: Colors.black,
            ),
          ) : const Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

          ),
        ),
      ),
    );
  }
}

