import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String title;
  bool isDone;
  bool isDeleted;

  Task({required this.title, this.isDone = false, this.isDeleted = false});

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        isDone = json['isDone'],
        isDeleted = json['isDeleted'];

  Task copyWith({String? title, bool? isDone, bool? isDeleted}) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [title, isDone, isDeleted];
}
