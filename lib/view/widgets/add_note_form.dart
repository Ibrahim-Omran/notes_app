
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';

import '../../cubits/add_notes_cubits/add_notes_cubit.dart';
import '../../cubits/add_notes_cubits/add_notes_state.dart';
import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}
class _AddNoteFormState extends State<AddNoteForm> {

  final GlobalKey<FormState> formKey = GlobalKey();
  // عشان اضمن ان البيانات اللي دخلة صح وعشان هيحصل تغير عملنها استيت فول
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  // وهنا عشان القيم هتتخل مختلفة كل مره فعملنا الويدجيت استيت فول
  String? title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children:   [
          const SizedBox(height: 32,),
          //**************CustomTextField(title)******************
          CustomTextField(
            onSaved: (value){
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          //**************CustomTextField(subTitle)****************
          CustomTextField(
            onSaved: (value){
              subTitle = value;
            },
            hint: 'content',
            maxLine: 5,
          ),
          const SizedBox(
            height: 32,
          ),

          const ColorsListView(),

          const SizedBox(
            height: 32,
          ),



          //*******************BlocBuilder(AddNotesCubit)************
          // استخدمنا الكيوبت هنا عشان نشوفه بيلود ولا لا
          BlocBuilder<AddNotesCubit,AddNotesState>(
            builder:(context,state)=> CustomButton(
              isLoading: state is AddNotesLoading ? true : false,
          //********************************************************
          //********************************************************
              onTap: (){
                // اعملي اتشيك علي الداتا لو الدنيا تمام احفظ
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();

                  var currentDate = DateTime.now();
                  var formattedCurrentDate = DateFormat.yMd().format(currentDate);
                //  البيانات اللي بتضاف
                  var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedCurrentDate,
                      color: Colors.blue.value,
                  );

                  BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                }else{
                  // لو الدنيا مش تمام شغلي الاتو فلديت علي طول
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }
              },
           //**************************************************************
            ),
          ),
          const SizedBox(
            height: 16,
          ),


        ],
      ),
    );
  }
}



