import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final title = categoryId[0].toUpperCase() + categoryId.substring(1);
    return Scaffold(
      appBar: AppBar(title: Text('$title detail')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _TimeRangeSelector(),
          const SizedBox(height: 16),
          _MetricCard(
            title: 'Top app',
            value: 'Placeholder',
            subtitle: 'Data not available on this device/OS.',
          ),
          const SizedBox(height: 16),
          _MetricCard(
            title: 'Daily breakdown',
            value: 'Chart placeholder',
            subtitle: 'Charts will render from local aggregates.',
          ),
          const SizedBox(height: 16),
          _HighlightCard(
            title: 'Highlights',
            points: const [
              'Most active day: Saturday',
              'Longest binge: 2h 15m',
              'Top 3 apps ready when data is available',
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeRangeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        ChoiceChip(label: Text('Today'), selected: true),
        ChoiceChip(label: Text('Week'), selected: false),
        ChoiceChip(label: Text('Month'), selected: false),
        ChoiceChip(label: Text('Year'), selected: false),
        ChoiceChip(label: Text('Custom'), selected: false),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
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
            Text(value, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({required this.title, required this.points});

  final String title;
  final List<String> points;

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
            for (final point in points)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('• $point'),
              ),
          ],
        ),
      ),
    );
  }
}
