enum AppCategory { music, photos, social, messaging, video, other }

class AppInfo {
  const AppInfo({
    required this.id,
    required this.packageName,
    required this.displayName,
    required this.category,
    required this.platform,
  });

  final String id;
  final String packageName;
  final String displayName;
  final AppCategory category;
  final String platform;
}
