import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
        builder: (context, state) {
          // بجيب النوت للاسكرينه دي
          List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
          return Padding(
            //  بادنج لليست فيو من فوق وتحت
            padding: const EdgeInsets.symmetric(vertical: 16),
            //  عشان نعمل اسكرول للنوت
            child: ListView.builder(
              itemCount: notes.length,
              // عشان الليست فيو بيبقي فيها بادنج باي ديفولت
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: NoteItem(
                        // بضيف يالقيم
                      note: notes[index],
                    ),
                  );
                }),
          );
        },);
  }
}