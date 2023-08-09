import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,
    required this.hint,
     this.maxLine = 1,
    this.onSaved, this.onChanged}) : super(key: key);


  final String hint;
  final  Function(String)? onChanged;
  final int maxLine;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value){
        // لو القيمه كانت بي نل و فضية رجع ايرور غير كدا نفز يا معلم
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }else{
          return null;
        }

      },
      // دا مؤشر الكتابة
      cursorColor: kPrimaryColor,
      maxLines: maxLine,
      decoration: InputDecoration(

        hintText: hint ,
        // hintStyle: TextStyle(
        //   color: kPrimaryColor,
        // ),

        // البوردر الديفولت
        border: buildBorder(),
        // البوردر اللي بيبقي ظاهر قبل مضغط علية
        enabledBorder: buildBorder(),
        // البوردر اللي بيظر بعد مضغط علية
        focusedBorder: buildBorder( kPrimaryColor ),
      ),
    );
  }



  //  عملنا هنا عشان منكروش كذا مره
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:  BorderSide(
          color: color ?? Colors.white,
        ),
      );
  }
}
