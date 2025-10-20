# Excelerate Mobile Application

## Overview
Excelerate Mobile Application is a cross-platform app built with Flutter that connects learners with educational programs offered through the Excelerate platform. The app provides an intuitive experience for discovering programs, registering for events and workshops, tracking learning progress, and submitting feedback.

## Objectives
- Facilitate easy discovery and browsing of educational programs
- Streamline registration for events and workshops
- Enable structured, post-program feedback collection
- Provide learning progress tracking and analytics
- Deliver timely notifications for events and announcements
- Offer administrative capabilities for program management and monitoring

## Target Users
- Learners: Browse programs, view details, enroll, track progress, and provide feedback
- Administrators: Create/manage programs, post announcements, monitor enrollment, and analyze feedback

## Application Flow
Splash → Onboarding → Login/Register → Home Dashboard
├─ Explore Courses (Search & Filter)
├─ My Courses (In Progress / Completed / Wishlist)
└─ Profile (Settings & Account)
↓
Course Details → Enrollment / Continue Learning → Feedback (post completion)

Users can navigate back to the home screen at any time using the bottom navigation bar or the back button.

## Core Features
### Authentication & Profile
- Secure login and registration
- Profile data management
- Session handling and logout

### Home Dashboard
- Personalized welcome
- Continue learning section
- Popular courses
- Category quick filters
- Integrated search access

### Program Discovery (Explore)
- Real-time search
- Filter chips (All, Popular, New, Free)
- Sorting options (Most Popular, Highest Rated, Newest, Price-based)
- Course list with title, instructor, rating, price, and duration

### Course Details
- Summary: title, rating, students
- Instructor card
- Tabs: Overview, Curriculum, Reviews
- Learning outcomes (What You’ll Learn)
- Requirements
- Curriculum with expandable sections and lesson states (completed/locked)

### My Courses
- Tabs: In Progress, Completed, Wishlist
- Progress bars and lesson counters
- Continue action for in-progress courses

### Profile
- Avatar, name, email
- Statistics: total courses, certificates, learning hours
- Menu items: account settings, notifications, downloads, privacy & security, help, about, logout

### Notifications
- Upcoming events and announcements
- Enrollment confirmations
- Reminders and updates

## Screenshots
Place the following images in the repository under a directory named `screenshots/`.

| Splash | Onboarding | Login | Home |
|--------|------------|-------|------|
| ![](screenshots/splash.png) | ![](screenshots/onboarding.png) | ![](screenshots/login.png) | ![](screenshots/home.png) |

| Course Details | Search | My Courses | Profile |
|----------------|--------|------------|---------|
| ![](screenshots/course_details.png) | ![](screenshots/search.png) | ![](screenshots/my_courses.png) | ![](screenshots/profile.png) |

## Demo Video
A full app walkthrough is available here:  
[Demo Video Link](YOUR_VIDEO_LINK_HERE)

Replace the placeholder with your final hosted link (YouTube or Google Drive view link).

## Technical Stack
- Framework: Flutter (3.0+)
- Language: Dart (3.0+)
- UI: Material Design 3
- Navigation: Flutter Navigator
- Version Control: Git & GitHub
- IDE: Android Studio or VS Code

## Key Dependencies
Update as needed to reflect pubspec.yaml.
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  smooth_page_indicator: ^1.1.0
  excelerate-app/
├─ lib/
│  ├─ main.dart
│  ├─ core/
│  │  ├─ constants/        # colors, sizes, text styles
│  │  ├─ theme/            # app theme
│  │  ├─ routes/           # navigation (if used)
│  │  └─ utils/            # helpers & validators
│  ├─ features/
│  │  ├─ splash/
│  │  ├─ onboarding/
│  │  ├─ auth/
│  │  ├─ home/
│  │  ├─ course_details/
│  │  ├─ search/
│  │  ├─ my_courses/
│  │  └─ profile/
│  └─ shared/
│     └─ widgets/          # reusable UI components
├─ assets/
│  ├─ images/
│  ├─ icons/
│  └─ fonts/
├─ screenshots/
└─ README.md
Getting Started
Prerequisites

    Flutter SDK 3.0+ and Dart 3.0+
    Android Studio or VS Code
    Git

Setup
git clone https://github.com/Youssef-Taqi-Eldeen/excelerate-app.git
cd excelerate-app
flutter pub get
flutter run
Build

Android (APK):
flutter build apk --release
iOS:
flutter build ios --release
Development Timeline

    Week 1: Planning and design (requirements and wireframes)
    Week 2: Core UI implementation and navigation structure
    Week 3–4: Feature development, API integration, and testing

Development Approach

    Iterative development with progressive enhancement
    Component-based UI with reusable widgets
    UX-first: clarity, accessibility, and consistency
    Clean code practices and maintainable structure
    Regular refactoring and quality checks

Contributing

This project is part of the Excelerate internship program. Contributions follow the established code review and quality processes.
To propose changes: fork the repository, create a feature branch, commit your changes, open a pull request.
License

This project is developed as part of the Excelerate training program.
Contact

Developer: Youssef Taqi Eldeen
Email: taqieldeenyoussef@gmail.com
