import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/view/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //**************************************
    // ************* عشان نوفر الكيوبت لي NotesView *****
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: (){

              showModalBottomSheet(
                // بيخلي البوتون شيت ينفع يسكرور لي فوق
                isScrollControlled: true,
                // عشان نخلي البوتون شيت الحواف بتعته مدورة سيكا
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                  context: context,
                  builder: (context){
                    return  AddNoteBottomSheet();
                  });

              },
          child: const Icon(Icons.add),

        ),


        body: const NotesViewBody(),


    );
  }
}
