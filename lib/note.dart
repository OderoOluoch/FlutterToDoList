import 'dart:convert';

class Note{
  int id;
  String note;
  Note(
  {
    required this.id,
    required this.note,
});

  Note copyWith({
  int? id,
    String? note,
}){
    return Note(
      id: id?? this.id,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'body': note
    };
  }

}