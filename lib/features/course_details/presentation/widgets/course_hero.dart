import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../home/data/models/course_model.dart';

class CourseHero extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;

  const CourseHero({
    super.key,
    required this.course,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: course.gradientColors,
        ),
      ),
      child: Stack(
        children: [
          // Background Icon
          Center(
            child: Icon(
              course.icon,
              size: 120,
              color: Colors.white.withOpacity(0.2),
            ),
          ),

          // Top Actions
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    _buildActionButton(
                      icon: Icons.arrow_back_ios,
                      onPressed: onBackPressed,
                    ),

                    // Right Actions
                    Row(
                      children: [
                        _buildActionButton(
                          icon: Icons.favorite_border,
                          onPressed: onFavoritePressed,
                        ),
                        const SizedBox(width: AppSizes.sm),
                        _buildActionButton(
                          icon: Icons.share_outlined,
                          onPressed: onSharePressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Play Button
          Center(
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 40,
                color: AppColors.primary,
              ),
            ),
          ),

          // Course Badge
          if (course.isBestseller || course.isNew)
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      course.isBestseller ? Icons.stars : Icons.fiber_new,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      course.isBestseller ? 'Bestseller' : 'New',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        // ✅ استخدمنا ClipOval للشكل الدائري
        child: BackdropFilter(
          // ✅ BackdropFilter منفصل
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}
