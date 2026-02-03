import 'dart:math';

import '../models/models.dart';

class MockRepository {
  final _random = Random(24);

  List<AppInfo> loadApps() {
    return const [
      AppInfo(
        id: 'spotify',
        packageName: 'com.spotify.music',
        displayName: 'Spotify',
        category: AppCategory.music,
        platform: 'android',
      ),
      AppInfo(
        id: 'insta',
        packageName: 'com.instagram.android',
        displayName: 'Instagram',
        category: AppCategory.social,
        platform: 'android',
      ),
      AppInfo(
        id: 'whatsapp',
        packageName: 'com.whatsapp',
        displayName: 'WhatsApp',
        category: AppCategory.messaging,
        platform: 'android',
      ),
      AppInfo(
        id: 'youtube',
        packageName: 'com.google.android.youtube',
        displayName: 'YouTube',
        category: AppCategory.video,
        platform: 'android',
      ),
      AppInfo(
        id: 'photos',
        packageName: 'com.google.android.apps.photos',
        displayName: 'Photos',
        category: AppCategory.photos,
        platform: 'android',
      ),
    ];
  }

  List<UsageSession> loadUsageSessions() {
    final now = DateTime.now();
    return List.generate(20, (index) {
      final start = now.subtract(Duration(hours: index * 3 + 1));
      final duration = (_random.nextInt(80) + 10) * 60 * 1000;
      return UsageSession(
        id: 'session_$index',
        appId: loadApps()[index % 5].id,
        startTimestamp: start,
        endTimestamp: start.add(Duration(milliseconds: duration)),
        durationMs: duration,
        dayKey: '${start.year}-${start.month}-${start.day}',
        weekKey: '${start.year}-W${_weekOfYear(start)}',
        monthKey: '${start.year}-${start.month}',
        yearKey: '${start.year}',
      );
    });
  }

  int _weekOfYear(DateTime date) {
    final firstDay = DateTime(date.year, 1, 1);
    final days = date.difference(firstDay).inDays;
    return (days / 7).floor() + 1;
  }
}
