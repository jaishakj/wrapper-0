import 'package:flutter/material.dart';

class WrappedScreen extends StatelessWidget {
  const WrappedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrapped')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _WrappedHeroCard(),
          const SizedBox(height: 16),
          const _WrappedCard(
            title: 'Your Year in One Screen',
            subtitle: '1,245 hours across 112 apps',
          ),
          const SizedBox(height: 16),
          const _WrappedCard(
            title: 'Top 5 Apps',
            subtitle: 'Spotify • Instagram • YouTube',
          ),
          const SizedBox(height: 16),
          const _WrappedCard(
            title: 'Final Roast',
            subtitle: 'You turned doomscrolling into a full-time job.',
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share Wrapped'),
          ),
        ],
      ),
    );
  }
}

class _WrappedHeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Generate your Wrapped',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              'Choose a date range and get shareable story cards.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {},
              child: const Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}

class _WrappedCard extends StatelessWidget {
  const _WrappedCard({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFF22D3EE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Wrapper 0',
                  style: TextStyle(color: Colors.white70),
                ),
                const Icon(Icons.auto_awesome, color: Colors.white70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
