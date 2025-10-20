class LessonModel {
  final String id;
  final String title;
  final String duration;
  final bool isCompleted;
  final bool isLocked;
  final String? videoUrl;

  LessonModel({
    required this.id,
    required this.title,
    required this.duration,
    this.isCompleted = false,
    this.isLocked = false,
    this.videoUrl,
  });
}
