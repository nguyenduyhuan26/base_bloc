# flutter_base_bloc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// run app
flutter run --debug --flavor development -t lib/mains/main_development.dart
flutter run --debug --flavor staging -t lib/mains/main_staging.dart
flutter run --debug --flavor production -t lib/mains/main_production.dart

// generation code
flutter pub run build_runner build --delete-conflicting-outputs
