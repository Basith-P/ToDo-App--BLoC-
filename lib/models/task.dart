import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String desc;
  final bool isDone;
  final bool isDeleted;

  Task(
      {required this.title,
      this.desc = '',
      this.isDone = false,
      this.isDeleted = false})
      : id = const Uuid().v1();

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        desc = json['desc'],
        isDone = json['isDone'],
        isDeleted = json['isDeleted'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'isDone': isDone,
        'isDeleted': isDeleted,
      };

  Task copyWith({String? title, String? desc, bool? isDone, bool? isDeleted}) {
    return Task(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [id, title, desc, isDone, isDeleted];
}
