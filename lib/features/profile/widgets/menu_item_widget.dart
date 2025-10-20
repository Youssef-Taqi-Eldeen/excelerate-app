import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDanger;
  final VoidCallback onTap;

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.isDanger = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isDanger
                    ? AppColors.error.withOpacity(0.1)
                    : AppColors.cardBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 24,
                color: isDanger ? AppColors.error : AppColors.primary,
              ),
            ),

            const SizedBox(width: AppSizes.md),

            // Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDanger ? AppColors.error : AppColors.textPrimary,
                ),
              ),
            ),

            // Arrow Icon
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: isDanger ? AppColors.error : AppColors.textHint,
            ),
          ],
        ),
      ),
    );
  }
}
