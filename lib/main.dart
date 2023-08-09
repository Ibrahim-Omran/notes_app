import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/view/notes_view.dart';

import 'cubits/notes_cubit/notes_cubit.dart';

void main() async{
  await Hive.initFlutter();
  // كدا انا قولت لي الهيف خلي بالك انتي لتتعملي معا النوت موديل بتاعي
  // لازم يبقي قبل الاوبن بوكس
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> NotesCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: const NotesView(),

    ),);
  }
}
