import 'package:excelerate_app/features/course_details/presentation/screens/course_details_screen.dart';
import 'package:excelerate_app/features/my_courses/presentation/screens/my_courses_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../home/data/models/course_model.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/filter_chips_widget.dart';
import '../widgets/course_list_item.dart';
import '../widgets/sort_bottom_sheet.dart';
import '../../../../shared/widgets/bottom_navigation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedFilterIndex = 0;
  String _selectedSort = 'Most Popular';
  int _currentNavIndex = 1; // Explore tab selected
  List<CourseModel> _allCourses = [];
  List<CourseModel> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadCourses() {
    // Sample Data
    _allCourses = [
      CourseModel(
        id: '1',
        title: 'JavaScript ES6+ Complete Course',
        instructor: 'Sarah Johnson',
        rating: 4.9,
        students: 3200,
        price: 59,
        duration: '18h',
        totalLessons: 35,
        category: 'Programming',
        icon: Icons.code,
        gradientColors: [Color(0xFF667EEA), Color(0xFF764BA2)],
        isNew: true,
      ),
      CourseModel(
        id: '2',
        title: 'Node.js Backend Development',
        instructor: 'Michael Chen',
        rating: 4.8,
        students: 2800,
        price: 69,
        duration: '22h',
        totalLessons: 42,
        category: 'Programming',
        icon: Icons.dns,
        gradientColors: [Color(0xFF10B981), Color(0xFF059669)],
      ),
      CourseModel(
        id: '3',
        title: 'Angular 15 - The Complete Guide',
        instructor: 'David Miller',
        rating: 4.7,
        students: 1900,
        price: 0,
        duration: '15h',
        totalLessons: 28,
        category: 'Programming',
        icon: Icons.web,
        gradientColors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
      ),
      CourseModel(
        id: '4',
        title: 'Docker & Kubernetes Masterclass',
        instructor: 'Alex Turner',
        rating: 5.0,
        students: 4500,
        price: 79,
        duration: '25h',
        totalLessons: 50,
        category: 'DevOps',
        icon: Icons.cloud,
        gradientColors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
        isBestseller: true,
      ),
      CourseModel(
        id: '5',
        title: 'Python Data Science Bootcamp',
        instructor: 'Emma Davis',
        rating: 4.9,
        students: 5200,
        price: 89,
        duration: '30h',
        totalLessons: 60,
        category: 'Data Science',
        icon: Icons.analytics,
        gradientColors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
        isBestseller: true,
      ),
      CourseModel(
        id: '6',
        title: 'React Native Mobile Development',
        instructor: 'James Wilson',
        rating: 4.6,
        students: 2100,
        price: 65,
        duration: '20h',
        totalLessons: 38,
        category: 'Mobile',
        icon: Icons.phone_android,
        gradientColors: [Color(0xFF06B6D4), Color(0xFF0891B2)],
      ),
    ];

    _filteredCourses = List.from(_allCourses);
  }

  void _filterCourses() {
    setState(() {
      _filteredCourses = _allCourses.where((course) {
        // Search filter
        if (_searchController.text.isNotEmpty) {
          final searchLower = _searchController.text.toLowerCase();
          final titleMatch = course.title.toLowerCase().contains(searchLower);
          final instructorMatch = course.instructor.toLowerCase().contains(
            searchLower,
          );
          if (!titleMatch && !instructorMatch) return false;
        }

        // Category filter
        switch (_selectedFilterIndex) {
          case 0: // All
            return true;
          case 1: // Popular
            return course.students > 3000;
          case 2: // New
            return course.isNew;
          case 3: // Free
            return course.price == 0;
          default:
            return true;
        }
      }).toList();

      // Sort
      _sortCourses();
    });
  }

  void _sortCourses() {
    switch (_selectedSort) {
      case 'Most Popular':
        _filteredCourses.sort((a, b) => b.students.compareTo(a.students));
        break;
      case 'Highest Rated':
        _filteredCourses.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Newest':
        // Keep original order or implement date sorting
        break;
      case 'Price: Low to High':
        _filteredCourses.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        _filteredCourses.sort((a, b) => b.price.compareTo(a.price));
        break;
    }
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SortBottomSheet(
        selectedSort: _selectedSort,
        onSortSelected: (sort) {
          setState(() {
            _selectedSort = sort;
            _sortCourses();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore Courses',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSizes.lg),

                  // Search Bar
                  SearchBarWidget(
                    controller: _searchController,
                    onChanged: (value) => _filterCourses(),
                    onFilterPressed: () {
                      // TODO: Show advanced filters
                    },
                  ),

                  const SizedBox(height: AppSizes.md),

                  // Filter Chips
                  FilterChipsWidget(
                    selectedIndex: _selectedFilterIndex,
                    onFilterSelected: (index) {
                      setState(() {
                        _selectedFilterIndex = index;
                        _filterCourses();
                      });
                    },
                  ),
                ],
              ),
            ),

            // Results Header
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_filteredCourses.length} Courses Found',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: _showSortBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.sort,
                            size: 18,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Sort',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Course List
            Expanded(
              child: _filteredCourses.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.lg,
                      ),
                      itemCount: _filteredCourses.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSizes.md),
                          child: CourseListItem(
                            course: _filteredCourses[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailsScreen(
                                    course: _filteredCourses[index],
                                  ),
                                ),
                              );
                            },
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
            // Home tab
            Navigator.pop(context);
          } else if (index == 2) {
            // My Courses tab
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyCoursesScreen()),
            );
          } else {
            setState(() {
              _currentNavIndex = index;
            });
          }
          // TODO: Add Profile navigation
        },
      ),
    );
  }

  Widget _buildEmptyState() {
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
            child: const Icon(
              Icons.search_off,
              size: 60,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          const Text(
            'No courses found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          const Text(
            'Try adjusting your filters',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
