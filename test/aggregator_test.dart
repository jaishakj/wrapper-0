import 'package:flutter_test/flutter_test.dart';
import 'package:wrapper_0/data/models/models.dart';
import 'package:wrapper_0/domain/aggregator.dart';

void main() {
  test('aggregator totals duration and ranks apps', () {
    final apps = [
      const AppInfo(
        id: 'a',
        packageName: 'a',
        displayName: 'App A',
        category: AppCategory.music,
        platform: 'android',
      ),
      const AppInfo(
        id: 'b',
        packageName: 'b',
        displayName: 'App B',
        category: AppCategory.social,
        platform: 'android',
      ),
    ];

    final sessions = [
      UsageSession(
        id: '1',
        appId: 'a',
        startTimestamp: DateTime(2024, 1, 1),
        endTimestamp: DateTime(2024, 1, 1, 1),
        durationMs: 1000,
        dayKey: '2024-01-01',
        weekKey: '2024-W1',
        monthKey: '2024-01',
        yearKey: '2024',
      ),
      UsageSession(
        id: '2',
        appId: 'b',
        startTimestamp: DateTime(2024, 1, 2),
        endTimestamp: DateTime(2024, 1, 2, 1),
        durationMs: 2000,
        dayKey: '2024-01-02',
        weekKey: '2024-W1',
        monthKey: '2024-01',
        yearKey: '2024',
      ),
    ];

    final aggregate = UsageAggregator().summarize(apps, sessions);

    expect(aggregate.totalDurationMs, 3000);
    expect(aggregate.topApps.first.app.id, 'b');
  });
}
