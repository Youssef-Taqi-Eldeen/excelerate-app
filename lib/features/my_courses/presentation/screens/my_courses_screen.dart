import 'package:excelerate_app/features/course_details/presentation/screens/course_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../home/data/models/course_model.dart';
import '../widgets/course_tabs_widget.dart';
import '../widgets/my_course_card_widget.dart';
import '../../../../shared/widgets/bottom_navigation.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  int _selectedTabIndex = 0;
  int _currentNavIndex = 2; // My Courses tab selected

  // Sample Data for courses
  final List<CourseModel> _inProgressCourses = [
    CourseModel(
      id: '1',
      title: 'Flutter Development Bootcamp',
      instructor: 'Ahmed Mohamed',
      rating: 4.8,
      students: 2142,
      price: 49,
      duration: '12h',
      totalLessons: 8,
      category: 'Programming',
      icon: Icons.flutter_dash,
      gradientColors: [Color(0xFF667EEA), Color(0xFF764BA2)],
    ),
    CourseModel(
      id: '2',
      title: 'Python Programming Masterclass',
      instructor: 'Sarah Johnson',
      rating: 4.9,
      students: 3200,
      price: 59,
      duration: '25h',
      totalLessons: 50,
      category: 'Programming',
      icon: Icons.code,
      gradientColors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
    ),
    CourseModel(
      id: '3',
      title: 'React JS Complete Guide',
      instructor: 'Michael Chen',
      rating: 4.7,
      students: 2800,
      price: 65,
      duration: '20h',
      totalLessons: 38,
      category: 'Programming',
      icon: Icons.web,
      gradientColors: [Color(0xFF10B981), Color(0xFF059669)],
    ),
    CourseModel(
      id: '4',
      title: 'SQL & Database Design',
      instructor: 'Emma Davis',
      rating: 4.6,
      students: 1900,
      price: 45,
      duration: '10h',
      totalLessons: 20,
      category: 'Database',
      icon: Icons.storage,
      gradientColors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
    ),
  ];

  final List<CourseModel> _completedCourses = [
    CourseModel(
      id: '5',
      title: 'JavaScript ES6+ Basics',
      instructor: 'David Miller',
      rating: 4.9,
      students: 4500,
      price: 39,
      duration: '8h',
      totalLessons: 15,
      category: 'Programming',
      icon: Icons.javascript,
      gradientColors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
    ),
    CourseModel(
      id: '6',
      title: 'UI/UX Design Principles',
      instructor: 'Alex Turner',
      rating: 5.0,
      students: 3800,
      price: 55,
      duration: '12h',
      totalLessons: 22,
      category: 'Design',
      icon: Icons.design_services,
      gradientColors: [Color(0xFF06B6D4), Color(0xFF0891B2)],
    ),
  ];

  final List<CourseModel> _wishlistCourses = [
    CourseModel(
      id: '7',
      title: 'Docker & Kubernetes',
      instructor: 'James Wilson',
      rating: 4.8,
      students: 5200,
      price: 79,
      duration: '25h',
      totalLessons: 45,
      category: 'DevOps',
      icon: Icons.cloud,
      gradientColors: [Color(0xFFEF4444), Color(0xFFDC2626)],
      isBestseller: true,
    ),
    CourseModel(
      id: '8',
      title: 'Machine Learning A-Z',
      instructor: 'Lisa Anderson',
      rating: 4.9,
      students: 6100,
      price: 89,
      duration: '35h',
      totalLessons: 60,
      category: 'AI/ML',
      icon: Icons.psychology,
      gradientColors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
      isNew: true,
    ),
  ];

  // Progress data (percentage completed)
  final Map<String, double> _courseProgress = {
    '1': 0.65, // 65%
    '2': 0.45, // 45%
    '3': 0.80, // 80%
    '4': 0.20, // 20%
  };

  List<CourseModel> _getCurrentTabCourses() {
    switch (_selectedTabIndex) {
      case 0:
        return _inProgressCourses;
      case 1:
        return _completedCourses;
      case 2:
        return _wishlistCourses;
      default:
        return _inProgressCourses;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentCourses = _getCurrentTabCourses();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Courses',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.cardBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: Show filter options
                      },
                      icon: const Icon(
                        Icons.filter_list,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Course Tabs
            CourseTabsWidget(
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),

            // Course List
            Expanded(
              child: currentCourses.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(AppSizes.lg),
                      itemCount: currentCourses.length,
                      itemBuilder: (context, index) {
                        final course = currentCourses[index];
                        final progress = _courseProgress[course.id] ?? 0.0;
                        final isInProgress = _selectedTabIndex == 0;
                        final isCompleted = _selectedTabIndex == 1;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSizes.md),
                          child: MyCourseCardWidget(
                            course: course,
                            progress: isInProgress
                                ? progress
                                : (isCompleted ? 1.0 : 0.0),
                            currentLesson: isInProgress
                                ? (progress * course.totalLessons).round()
                                : (isCompleted ? course.totalLessons : 0),
                            showProgress:
                                _selectedTabIndex !=
                                2, // Hide progress for wishlist
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CourseDetailsScreen(course: course),
                                ),
                              );
                            },
                            onContinue: isInProgress
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CourseDetailsScreen(course: course),
                                      ),
                                    );
                                  }
                                : null,
                          ),
                        );
                      },
                    ),
            ),
          ],
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
            // TODO: Implement navigation
          } else {
            setState(() {
              _currentNavIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    String title = '';
    String subtitle = '';
    IconData icon = Icons.book;

    switch (_selectedTabIndex) {
      case 0:
        title = 'No courses in progress';
        subtitle = 'Start learning something new today!';
        icon = Icons.play_circle_outline;
        break;
      case 1:
        title = 'No completed courses';
        subtitle = 'Complete your first course to see it here';
        icon = Icons.check_circle_outline;
        break;
      case 2:
        title = 'Your wishlist is empty';
        subtitle = 'Add courses you want to learn later';
        icon = Icons.favorite_border;
        break;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 60, color: AppColors.primary),
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
