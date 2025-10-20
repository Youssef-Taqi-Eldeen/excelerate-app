import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../data/models/section_model.dart';
import 'lesson_item.dart';

class CurriculumSection extends StatelessWidget {
  final List<SectionModel> sections;
  final Function(int) onSectionTap;

  const CurriculumSection({
    super.key,
    required this.sections,
    required this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Course Content',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSizes.md),
        ...List.generate(
          sections.length,
          (index) => _buildSectionItem(section: sections[index], index: index),
        ),
      ],
    );
  }

  Widget _buildSectionItem({
    required SectionModel section,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(
          color: section.isExpanded
              ? AppColors.primary
              : const Color(0xFFE2E8F0),
          width: section.isExpanded ? 2 : 1,
        ),
      ),
      child: Column(
        children: [
          // Section Header
          InkWell(
            onTap: () => onSectionTap(index),
            borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: Row(
                children: [
                  Icon(
                    section.isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Expanded(
                    child: Text(
                      section.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    section.lessonsCountText,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Lessons List (Expandable)
          if (section.isExpanded)
            Container(
              padding: const EdgeInsets.only(
                left: AppSizes.md,
                right: AppSizes.md,
                bottom: AppSizes.md,
              ),
              child: Column(
                children: section.lessons.map((lesson) {
                  return LessonItem(
                    lesson: lesson,
                    onTap: () {
                      // TODO: Navigate to lesson
                    },
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
