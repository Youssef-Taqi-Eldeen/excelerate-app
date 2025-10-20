import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class StatsGridWidget extends StatelessWidget {
  final int totalCourses;
  final int certificates;
  final int learningHours;

  const StatsGridWidget({
    super.key,
    required this.totalCourses,
    required this.certificates,
    required this.learningHours,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.book_outlined,
            value: totalCourses.toString(),
            label: 'Courses',
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppSizes.md),
        Expanded(
          child: _buildStatCard(
            icon: Icons.workspace_premium_outlined,
            value: certificates.toString(),
            label: 'Certificates',
            color: AppColors.accent,
          ),
        ),
        const SizedBox(width: AppSizes.md),
        Expanded(
          child: _buildStatCard(
            icon: Icons.access_time,
            value: learningHours.toString(),
            label: 'Hours',
            color: AppColors.success,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 26, color: color),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
