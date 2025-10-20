import 'lesson_model.dart';

class SectionModel {
  final String id;
  final String title;
  final List<LessonModel> lessons;
  final bool isExpanded;

  SectionModel({
    required this.id,
    required this.title,
    required this.lessons,
    this.isExpanded = false,
  });

  int get completedLessonsCount {
    return lessons.where((lesson) => lesson.isCompleted).length;
  }

  int get totalLessons => lessons.length;

  String get lessonsCountText => '$totalLessons lessons';
}
