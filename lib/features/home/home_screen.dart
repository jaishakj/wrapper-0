import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_repository.dart';
import '../../domain/aggregator.dart';
import '../../domain/commentary_engine.dart';

final homeSummaryProvider = Provider<UsageAggregate>((ref) {
  final repo = MockRepository();
  final aggregator = UsageAggregator();
  return aggregator.summarize(repo.loadApps(), repo.loadUsageSessions());
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(homeSummaryProvider);
    final topApp = summary.topApps.isNotEmpty
        ? summary.topApps.first.app.displayName
        : 'Your phone';
    final commentary = CommentaryEngine().generate(
      level: SarcasmLevel.medium,
      input: UsageAggregateInput(
        dominantCategory: summary.topApps.isNotEmpty
            ? summary.topApps.first.app.category
            : AppCategory.other,
        topAppName: topApp,
        socialHours: 4.5,
        productiveHours: 1.2,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrapper 0'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _TimeRangeChips(),
            const SizedBox(height: 20),
            _SummaryCard(
              title: 'Total screen time',
              value: _formatHours(summary.totalDurationMs),
              subtitle: 'Across ${summary.topApps.length} apps',
            ),
            const SizedBox(height: 16),
            _TopAppsCard(summary: summary),
            const SizedBox(height: 16),
            _CommentaryCard(text: commentary),
            const SizedBox(height: 16),
            _CategoryGrid(),
          ],
        ),
      ),
    );
  }

  String _formatHours(int ms) {
    final hours = ms / 1000 / 60 / 60;
    return '${hours.toStringAsFixed(1)}h';
  }
}

class _TimeRangeChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        ChoiceChip(label: Text('Today'), selected: true),
        ChoiceChip(label: Text('Week'), selected: false),
        ChoiceChip(label: Text('Month'), selected: false),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.value,
    required this.subtitle,
  });

  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(value, style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 8),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}

class _TopAppsCard extends StatelessWidget {
  const _TopAppsCard({required this.summary});

  final UsageAggregate summary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top apps', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            for (final app in summary.topApps.take(3))
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(child: Icon(Icons.apps)),
                title: Text(app.app.displayName),
                subtitle: Text(_formatHours(app.durationMs)),
              ),
          ],
        ),
      ),
    );
  }

  String _formatHours(int ms) {
    final hours = ms / 1000 / 60 / 60;
    return '${hours.toStringAsFixed(1)}h';
  }
}

class _CommentaryCard extends StatelessWidget {
  const _CommentaryCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.auto_awesome, size: 28),
            const SizedBox(width: 12),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dive deeper', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: const [
            _CategoryTile(label: 'Music', icon: Icons.headphones),
            _CategoryTile(label: 'Photos', icon: Icons.camera_alt),
            _CategoryTile(label: 'Social', icon: Icons.flash_on),
            _CategoryTile(label: 'Messaging', icon: Icons.chat_bubble),
            _CategoryTile(label: 'Video', icon: Icons.play_circle),
          ],
        ),
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}
