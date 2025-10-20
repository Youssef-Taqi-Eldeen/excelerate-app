import 'package:flutter/material.dart';

class CourseModel {
  final String id;
  final String title;
  final String instructor;
  final double rating;
  final int students;
  final double price;
  final String duration;
  final int totalLessons;
  final String category;
  final IconData icon;
  final List<Color> gradientColors;
  final bool isBestseller;
  final bool isNew;

  CourseModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.rating,
    required this.students,
    required this.price,
    required this.duration,
    required this.totalLessons,
    required this.category,
    required this.icon,
    required this.gradientColors,
    this.isBestseller = false,
    this.isNew = false,
  });
}
