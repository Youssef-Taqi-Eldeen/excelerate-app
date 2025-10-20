import 'package:excelerate_app/features/course_details/presentation/screens/course_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../data/models/course_model.dart';
import '../../data/models/category_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/category_chip.dart';
import '../widgets/continue_learning_card.dart';
import '../widgets/course_card.dart';
import '../../../../shared/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  int _currentNavIndex = 0;

  // Sample Data
  final List<CategoryModel> _categories = [
    CategoryModel(id: '1', name: 'All', icon: Icons.apps),
    CategoryModel(id: '2', name: 'Programming', icon: Icons.code),
    CategoryModel(id: '3', name: 'Design', icon: Icons.palette),
    CategoryModel(id: '4', name: 'Business', icon: Icons.business_center),
    CategoryModel(id: '5', name: 'Marketing', icon: Icons.campaign),
  ];

  final List<CourseModel> _courses = [
    CourseModel(
      id: '1',
      title: 'Python Programming Masterclass',
      instructor: 'Sarah Johnson',
      rating: 4.8,
      students: 2142,
      price: 49,
      duration: '12h',
      totalLessons: 25,
      category: 'Programming',
      icon: Icons.code,
      gradientColors: [Color(0xFF667EEA), Color(0xFF764BA2)],
      isBestseller: true,
    ),
    CourseModel(
      id: '2',
      title: 'React JS Complete Guide 2024',
      instructor: 'Michael Chen',
      rating: 4.9,
      students: 3521,
      price: 59,
      duration: '18h',
      totalLessons: 32,
      category: 'Programming',
      icon: Icons.web,
      gradientColors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
      isNew: true,
    ),
    CourseModel(
      id: '3',
      title: 'UI/UX Design Fundamentals',
      instructor: 'Emma Davis',
      rating: 4.7,
      students: 1823,
      price: 39,
      duration: '10h',
      totalLessons: 18,
      category: 'Design',
      icon: Icons.design_services,
      gradientColors: [Color(0xFF10B981), Color(0xFF059669)],
    ),
    CourseModel(
      id: '4',
      title: 'Digital Marketing Pro',
      instructor: 'David Miller',
      rating: 5.0,
      students: 4231,
      price: 69,
      duration: '15h',
      totalLessons: 28,
      category: 'Marketing',
      icon: Icons.trending_up,
      gradientColors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            CustomAppBar(
              userName: 'John Doe',
              onNotificationTap: () {
                // TODO: Navigate to notifications
              },
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSizes.lg),

                    // Categories
                    _buildCategories(),

                    const SizedBox(height: AppSizes.xl),

                    // Continue Learning
                    _buildContinueLearningSection(),

                    const SizedBox(height: AppSizes.xl),

                    // Popular Courses
                    _buildPopularCoursesSection(),

                    const SizedBox(height: AppSizes.xl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: AppSizes.md),
            child: CategoryChip(
              category: _categories[index],
              isSelected: _selectedCategoryIndex == index,
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildContinueLearningSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Continue Learning',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: View all
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.md),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: ContinueLearningCard(
            title: 'Flutter Development Bootcamp',
            instructor: 'Ahmed Mohamed',
            progress: 0.65,
            currentLesson: 3,
            totalLessons: 8,
            onTap: () {
              // نستخدم أول كورس كمثال
              if (_courses.isNotEmpty) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        CourseDetailsScreen(course: _courses[0]),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOutCubic;

                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));

                          var fadeAnimation = Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).animate(animation);

                          return FadeTransition(
                            opacity: fadeAnimation,
                            child: SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            ),
                          );
                        },
                    transitionDuration: const Duration(milliseconds: 400),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularCoursesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: View all
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.md),
        SizedBox(
          height: 295,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
            itemCount: _courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: AppSizes.md),
                child: CourseCard(
                  course: _courses[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            CourseDetailsScreen(course: _courses[index]),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOutCubic;

                              var tween = Tween(
                                begin: begin,
                                end: end,
                              ).chain(CurveTween(curve: curve));

                              var fadeAnimation = Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(animation);

                              return FadeTransition(
                                opacity: fadeAnimation,
                                child: SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                ),
                              );
                            },
                        transitionDuration: const Duration(milliseconds: 400),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
