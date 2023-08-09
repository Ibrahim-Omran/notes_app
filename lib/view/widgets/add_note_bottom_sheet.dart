import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../../cubits/add_notes_cubits/add_notes_cubit.dart';
import '../../cubits/add_notes_cubits/add_notes_state.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
   const AddNoteBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      // عرفت الكيوبت للاسكرين دي بس لان مش محتجها غير هنا
      create: (context)=> AddNotesCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNotesCubit,AddNotesState>(
            listener: (context,state){
              if(state is AddNotesFailure){
                print('failed ${state.errMessages}');
              }
              if(state is AddNotesSuccess){
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }

            },
            builder: (context,state) =>
            // دي مش بتخليني اعرف اتعامل معا الاسكريين طول ما هي شغالة
                AbsorbPointer(
                  absorbing: state is AddNotesLoading ? true : false,
                 child:  Padding(
                   padding: EdgeInsets.only(
                   left: 16,
                   right: 16,
                   // بخلي الكي بورد يبقي تحت التكسيت فيلد بتاعي
                   bottom: MediaQuery.of(context).viewInsets.bottom),

                  child: const SingleChildScrollView(
                    child:  AddNoteForm(),
                ),
              ),
            ),
            ),
      ),
    );
  }
}


