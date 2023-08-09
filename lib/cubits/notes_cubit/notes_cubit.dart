import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../constants.dart';
import '../../models/note_model.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes ;
  fetchAllNotes(){
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      // بستقبل البيانات اللي جيالي وبعتها لي اليست اللي في الاستيت بتعتي
       notes = notesBox.values.toList();
      emit(NotesSuccess());

  }
}