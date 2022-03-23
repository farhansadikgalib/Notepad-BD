//
//
// final String tableNotes = 'notes';
// class NoteFields {
//
//   static final List<String> values = [
//     id,number,title,isImportant,des,time
//   ];
//
//   static final String id = '_id';
//   static final isImportant = 'isImportant';
//   static final title = 'title';
//   static final number = 'number';
//   static final des = 'description';
//   static final time = 'time';
// }
//
// class Notepad {
//   final int? id;
//   final bool isImportant;
//   final int number;
//   final String title;
//   final String des;
//   final DateTime createdTime;
//
//   const Notepad({
//       this.id,
//       required this.isImportant,
//       required this.number,
//       required this.title,
//       required this.des,
//       required this.createdTime});
//
//   Notepad copy({
//     int? id,
//     bool? isImportant,
//     String? title,
//     int? number,
//     String? des,
//     DateTime? createdTime,
//   }) =>
//       Notepad(
//           id: id ?? this.id,
//           isImportant: isImportant ?? this.isImportant,
//           number: number ?? this.number,
//           title: title ?? this.title,
//           des: des ?? this.title,
//           createdTime: createdTime?? createdTime);
//
//   static Notepad fromJson(Map<String, Object?> json) => Notepad(
//         id: json[NoteFields.id] as int?,
//         isImportant: json[NoteFields.isImportant] == 1,
//         number: json[NoteFields.number] as int,
//         title: json[NoteFields.title] as String,
//         des: json[NoteFields.des] as String,
//         createdTime: DateTime.parse([NoteFields.time] as String,)
//       );
//
//   Map<String, Object> toJson()=>{
//     NoteFields.id: id,
//     NoteFields.title:title,
//     NoteFields.isImportant:isImportant? 1 : 0,
//     NoteFields.number:number,
//     NoteFields.des:des,
//     NoteFields.time:createdTime.toIso8601String(),
//   };
// }



final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id, isImportant, number, title, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Notepad {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Notepad({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Notepad copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Notepad(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Notepad fromJson(Map<String, Object?> json) => Notepad(
    id: json[NoteFields.id] as int?,
    isImportant: json[NoteFields.isImportant] == 1,
    number: json[NoteFields.number] as int,
    title: json[NoteFields.title] as String,
    description: json[NoteFields.description] as String,
    createdTime: DateTime.parse(json[NoteFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.isImportant: isImportant ? 1 : 0,
    NoteFields.number: number,
    NoteFields.description: description,
    NoteFields.time: createdTime.toIso8601String(),
  };
}
