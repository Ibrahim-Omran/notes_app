
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState>{
    AddNotesCubit() : super(AddNotesInitial());


    Color color = const Color(0xffAC3931) ;
    addNote(NoteModel note) async {

        note.color = color.value;
        emit(AddNotesLoading());
        try {
            var notesBox = Hive.box<NoteModel>(kNotesBox);
            await notesBox.add(note);
            emit(AddNotesSuccess());
        }catch(e){
            emit(AddNotesFailure(e.toString()));
        }

    }


}