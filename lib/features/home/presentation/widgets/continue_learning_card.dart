import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class ContinueLearningCard extends StatelessWidget {
  final String title;
  final String instructor;
  final double progress;
  final int currentLesson;
  final int totalLessons;
  final VoidCallback onTap;

  const ContinueLearningCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.progress,
    required this.currentLesson,
    required this.totalLessons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.lg),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              'by $instructor',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: AppSizes.md),

            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white.withOpacity(0.25),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 8,
              ),
            ),

            const SizedBox(height: AppSizes.md),

            Text(
              '${(progress * 100).toInt()}% Complete • $currentLesson of $totalLessons lessons',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.95),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
