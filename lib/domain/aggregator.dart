import '../data/models/models.dart';

class UsageAggregate {
  const UsageAggregate({
    required this.totalDurationMs,
    required this.topApps,
  });

  final int totalDurationMs;
  final List<AppUsageSummary> topApps;
}

class AppUsageSummary {
  const AppUsageSummary({
    required this.app,
    required this.durationMs,
  });

  final AppInfo app;
  final int durationMs;
}

class UsageAggregator {
  UsageAggregate summarize(List<AppInfo> apps, List<UsageSession> sessions) {
    final totals = <String, int>{};
    for (final session in sessions) {
      totals.update(
        session.appId,
        (value) => value + session.durationMs,
        ifAbsent: () => session.durationMs,
      );
    }

    final topApps = totals.entries
        .map((entry) {
          final app = apps.firstWhere((element) => element.id == entry.key);
          return AppUsageSummary(app: app, durationMs: entry.value);
        })
        .toList()
      ..sort((a, b) => b.durationMs.compareTo(a.durationMs));

    final totalDurationMs = totals.values.fold(0, (sum, value) => sum + value);

    return UsageAggregate(
      totalDurationMs: totalDurationMs,
      topApps: topApps,
    );
  }
}
