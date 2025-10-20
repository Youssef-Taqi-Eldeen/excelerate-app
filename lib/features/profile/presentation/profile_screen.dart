import 'package:excelerate_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/stats_grid_widget.dart';
import '../widgets/menu_item_widget.dart';
import '../../../../shared/widgets/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentNavIndex = 3; // Profile tab selected

  // User Data
  final String _userName = 'John Doe';
  final String _userEmail = 'john.doe@example.com';
  final int _totalCourses = 12;
  final int _certificates = 8;
  final int _learningHours = 156;

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
        ),
        title: const Text(
          'Logout',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with Back Button
              Container(
                padding: const EdgeInsets.all(AppSizes.lg),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.cardBg,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.cardBg,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          // TODO: Show options menu
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.lg),

              // Profile Header
              ProfileHeaderWidget(
                userName: _userName,
                userEmail: _userEmail,
                onEditPressed: () {
                  // TODO: Navigate to edit profile
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit Profile feature coming soon!'),
                      backgroundColor: AppColors.info,
                    ),
                  );
                },
              ),

              const SizedBox(height: AppSizes.lg),

              // Stats Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: StatsGridWidget(
                  totalCourses: _totalCourses,
                  certificates: _certificates,
                  learningHours: _learningHours,
                ),
              ),

              const SizedBox(height: AppSizes.lg),

              // Menu Items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: Container(
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
                      MenuItemWidget(
                        icon: Icons.person_outline,
                        title: 'Account Settings',
                        onTap: () {
                          // TODO: Navigate to account settings
                        },
                      ),
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      MenuItemWidget(
                        icon: Icons.notifications_outlined,
                        title: 'Notifications',
                        onTap: () {
                          // TODO: Navigate to notifications settings
                        },
                      ),
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      MenuItemWidget(
                        icon: Icons.download_outlined,
                        title: 'Download Courses',
                        onTap: () {
                          // TODO: Navigate to downloads
                        },
                      ),
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      MenuItemWidget(
                        icon: Icons.lock_outline,
                        title: 'Privacy & Security',
                        onTap: () {
                          // TODO: Navigate to privacy settings
                        },
                      ),
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      MenuItemWidget(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        onTap: () {
                          // TODO: Navigate to help center
                        },
                      ),
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      MenuItemWidget(
                        icon: Icons.info_outline,
                        title: 'About',
                        onTap: () {
                          // TODO: Show about dialog
                        },
                      ),
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      MenuItemWidget(
                        icon: Icons.logout,
                        title: 'Logout',
                        isDanger: true,
                        onTap: _showLogoutDialog,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.xxl),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          if (index == 0) {
            // Navigate to Home
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (index == 1) {
            // Navigate to Search
            // Will be handled by navigation
          } else if (index == 2) {
            // Navigate to My Courses
            // Will be handled by navigation
          } else {
            setState(() {
              _currentNavIndex = index;
            });
          }
        },
      ),
    );
  }
}
