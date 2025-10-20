import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../data/models/lesson_model.dart';

class LessonItem extends StatelessWidget {
  final LessonModel lesson;
  final VoidCallback onTap;

  const LessonItem({super.key, required this.lesson, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.sm),
      child: InkWell(
        onTap: lesson.isLocked ? null : onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
          ),
          child: Row(
            children: [
              // Icon
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: _getIconBackgroundColor(),
                  shape: BoxShape.circle,
                ),
                child: Icon(_getIcon(), size: 18, color: _getIconColor()),
              ),

              const SizedBox(width: AppSizes.md),

              // Title
              Expanded(
                child: Text(
                  lesson.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: lesson.isLocked
                        ? AppColors.textHint
                        : AppColors.textPrimary,
                  ),
                ),
              ),

              // Duration
              Text(
                lesson.duration,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    if (lesson.isCompleted) {
      return Icons.check_circle;
    } else if (lesson.isLocked) {
      return Icons.lock;
    } else {
      return Icons.play_circle_outline;
    }
  }

  Color _getIconColor() {
    if (lesson.isCompleted) {
      return AppColors.success;
    } else if (lesson.isLocked) {
      return AppColors.textHint;
    } else {
      return AppColors.primary;
    }
  }

  Color _getIconBackgroundColor() {
    if (lesson.isCompleted) {
      return AppColors.success.withOpacity(0.1);
    } else if (lesson.isLocked) {
      return AppColors.textHint.withOpacity(0.1);
    } else {
      return AppColors.primary.withOpacity(0.1);
    }
  }
}
