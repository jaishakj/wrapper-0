class UsageSession {
  const UsageSession({
    required this.id,
    required this.appId,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.durationMs,
    required this.dayKey,
    required this.weekKey,
    required this.monthKey,
    required this.yearKey,
  });

  final String id;
  final String appId;
  final DateTime startTimestamp;
  final DateTime endTimestamp;
  final int durationMs;
  final String dayKey;
  final String weekKey;
  final String monthKey;
  final String yearKey;
}
