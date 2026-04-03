# personal_companion_app

A new Flutter project.

## Getting Started

#  Personal Companion App - Bostone Onkoba

A polished, modular Flutter application developed for the Zorvyn Mobile App Developer Intern assessment. This app focuses on expense tracking, data visualization, and financial goals.

---

##  Features
* **Dynamic Dashboard:** Real-time overview of balance and spending.
* **Transaction Management:** A dedicated history view with state-driven updates.
* **Financial Challenges:** A gamified "Challenges" module to track savings streaks.
* **Interactive UI:** Integrated a Modal Bottom Sheet for seamless data entry.

##  Tech Stack & Architecture
* **Framework:** Flutter (Dart)
* **State Management:** `StatefulWidget` / `setState` for efficient, localized updates.
* **Navigation:** `BottomNavigationBar` with an indexed page-switching logic.
* **Styling:** Material 3 Design with custom ColorSchemes.

##  Key Enhancements (Optional Requirements)
To provide a "premium" feel, I implemented the following:
1.  **Animated Transitions:** Used `AnimatedSwitcher` with `FadeTransition` and `ScaleTransition` for fluid movement between tabs.
2.  **Smooth Scrolling:** Integrated `BouncingScrollPhysics` and solved nested scroll conflicts to ensure a 60fps experience.
3.  **Modular Codebase:** Refactored the app into a multi-file architecture to ensure scalability and prevent namespace collisions.

##  Architectural Decisions
* **Why Modular?** Separating screens into `home_dashboard.dart`, `transaction.dart`, and `challenge.dart` allows for independent testing and cleaner version control.
* **Why AnimatedSwitcher?** It enhances the User Experience (UX) by providing visual continuity, a key requirement for modern fintech applications.
* **Why Bouncing Physics?** It provides an "iOS-style" elastic feel that makes the interface feel more responsive to touch and scroll inputs.

##  Installation & Setup
1. Clone the repository.
2. Ensure you have the Flutter SDK installed.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run -d chrome` to view the application.

---
**Developed by:** Bostone Onkoba  
**Position:** Mobile App Developer Intern Candidate (Zorvyn, Thank you in advance)
