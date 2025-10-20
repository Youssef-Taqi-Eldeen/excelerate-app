import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../home/data/models/course_model.dart';
import '../../data/models/section_model.dart';
import '../../data/models/lesson_model.dart';
import '../widgets/course_hero.dart';
import '../widgets/instructor_card.dart';
import '../widgets/course_tabs.dart';
import '../widgets/what_you_learn.dart';
import '../widgets/requirements_section.dart';
import '../widgets/curriculum_section.dart';
import '../widgets/enroll_footer.dart';

class CourseDetailsScreen extends StatefulWidget {
  final CourseModel course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  int _selectedTabIndex = 0;
  List<SectionModel> _sections = [];

  @override
  void initState() {
    super.initState();
    _loadSections();
  }

  void _loadSections() {
    // Sample Data - في التطبيق الحقيقي هتيجي من API
    _sections = [
      SectionModel(
        id: '1',
        title: 'Section 1: Introduction',
        isExpanded: true,
        lessons: [
          LessonModel(
            id: '1',
            title: 'Welcome to the course',
            duration: '5 min',
            isCompleted: true,
          ),
          LessonModel(
            id: '2',
            title: 'Setting up the environment',
            duration: '12 min',
            isCompleted: false,
          ),
          LessonModel(
            id: '3',
            title: 'Your first project',
            duration: '20 min',
            isCompleted: false,
            isLocked: true,
          ),
        ],
      ),
      SectionModel(
        id: '2',
        title: 'Section 2: Fundamentals',
        lessons: [
          LessonModel(
            id: '4',
            title: 'Understanding the basics',
            duration: '15 min',
            isLocked: true,
          ),
          LessonModel(
            id: '5',
            title: 'Working with variables',
            duration: '18 min',
            isLocked: true,
          ),
        ],
      ),
      SectionModel(
        id: '3',
        title: 'Section 3: Advanced Concepts',
        lessons: [
          LessonModel(
            id: '6',
            title: 'Deep dive into features',
            duration: '25 min',
            isLocked: true,
          ),
        ],
      ),
    ];
  }

  void _toggleSection(int index) {
    setState(() {
      _sections[index] = SectionModel(
        id: _sections[index].id,
        title: _sections[index].title,
        lessons: _sections[index].lessons,
        isExpanded: !_sections[index].isExpanded,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Hero Image with Back Button
              SliverToBoxAdapter(
                child: CourseHero(
                  course: widget.course,
                  onBackPressed: () => Navigator.pop(context),
                  onFavoritePressed: () {
                    // TODO: Toggle favorite
                  },
                  onSharePressed: () {
                    // TODO: Share course
                  },
                ),
              ),

              // Course Details Content
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppSizes.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              widget.course.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                                height: 1.3,
                              ),
                            ),

                            const SizedBox(height: AppSizes.md),

                            // Stats
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.accent,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${widget.course.rating}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(${widget.course.students} ratings)',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: AppSizes.md),
                                const Icon(
                                  Icons.people_outline,
                                  size: 18,
                                  color: AppColors.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${widget.course.students} students',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: AppSizes.lg),

                            // Instructor Card
                            InstructorCard(
                              name: widget.course.instructor,
                              title: 'Senior Software Engineer',
                              onTap: () {
                                // TODO: Navigate to instructor profile
                              },
                            ),
                          ],
                        ),
                      ),

                      // Tabs
                      CourseTabs(
                        selectedIndex: _selectedTabIndex,
                        onTabSelected: (index) {
                          setState(() {
                            _selectedTabIndex = index;
                          });
                        },
                      ),

                      // Tab Content
                      Padding(
                        padding: const EdgeInsets.all(AppSizes.lg),
                        child: _buildTabContent(),
                      ),

                      const SizedBox(height: 100), // Space for fixed button
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Fixed Enroll Button
          EnrollFooter(
            price: widget.course.price,
            oldPrice: widget.course.price * 1.5,
            onEnrollPressed: () {
              // TODO: Handle enrollment
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Enrollment feature coming soon!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0: // Overview
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WhatYouLearn(
              items: [
                'Build professional mobile applications',
                'Master programming fundamentals',
                'Work with databases and APIs',
                'Create real-world projects',
                'Deploy apps to production',
              ],
            ),
            const SizedBox(height: AppSizes.xl),
            const RequirementsSection(
              requirements: [
                'Basic computer knowledge',
                'No programming experience needed',
                'Windows, Mac, or Linux computer',
                'Internet connection',
              ],
            ),
          ],
        );

      case 1: // Curriculum
        return CurriculumSection(
          sections: _sections,
          onSectionTap: _toggleSection,
        );

      case 2: // Reviews
        return _buildReviewsTab();

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildReviewsTab() {
    return Column(
      children: [
        // Review Summary
        Container(
          padding: const EdgeInsets.all(AppSizes.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    '${widget.course.rating}',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < widget.course.rating.floor()
                            ? Icons.star
                            : Icons.star_border,
                        size: 20,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.course.students} ratings',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: AppSizes.xl),
              Expanded(
                child: Column(
                  children: [
                    _buildRatingBar('5', 0.8),
                    _buildRatingBar('4', 0.15),
                    _buildRatingBar('3', 0.03),
                    _buildRatingBar('2', 0.01),
                    _buildRatingBar('1', 0.01),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSizes.lg),

        // Individual Reviews
        _buildReviewItem(
          name: 'Sarah Johnson',
          rating: 5,
          comment: 'Excellent course! Very detailed and easy to follow.',
          time: '2 days ago',
        ),
        const SizedBox(height: AppSizes.md),
        _buildReviewItem(
          name: 'Michael Chen',
          rating: 5,
          comment: 'Best investment I made this year. Highly recommended!',
          time: '1 week ago',
        ),
        const SizedBox(height: AppSizes.md),
        _buildReviewItem(
          name: 'Emma Davis',
          rating: 4,
          comment: 'Great content, but could use more practical examples.',
          time: '2 weeks ago',
        ),
      ],
    );
  }

  Widget _buildRatingBar(String stars, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              stars,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const Icon(Icons.star, size: 12, color: AppColors.accent),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percentage,
                backgroundColor: AppColors.cardBg,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.accent,
                ),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required int rating,
    required String comment,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    name.substring(0, 1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            size: 14,
                            color: AppColors.accent,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            comment,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
