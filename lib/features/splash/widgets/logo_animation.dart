import 'package:excelerate_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LogoAnimation extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const LogoAnimation({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, child) {
        return Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.school_rounded,
              size: 60,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}
