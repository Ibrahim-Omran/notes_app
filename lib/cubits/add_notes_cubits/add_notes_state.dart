

abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState{}

class AddNotesLoading extends AddNotesState{}

class AddNotesSuccess extends AddNotesState{}

class AddNotesFailure extends AddNotesState{
  //  رسالة الخطاء عشان يعرف اي السبب
  final String errMessages;
  AddNotesFailure(this.errMessages);
}

