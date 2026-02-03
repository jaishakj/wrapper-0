import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const _SectionHeader(title: 'Theme'),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
              ButtonSegment(value: ThemeMode.light, label: Text('Light')),
              ButtonSegment(value: ThemeMode.system, label: Text('Auto')),
            ],
            selected: {themeMode},
            onSelectionChanged: (value) {
              ref.read(themeModeProvider.notifier).state = value.first;
            },
          ),
          const SizedBox(height: 24),
          const _SectionHeader(title: 'Categories'),
          _SwitchRow(title: 'Music'),
          _SwitchRow(title: 'Photos'),
          _SwitchRow(title: 'Social'),
          _SwitchRow(title: 'Messaging'),
          _SwitchRow(title: 'Video'),
          const SizedBox(height: 24),
          const _SectionHeader(title: 'Sarcasm'),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Enable sarcasm'),
            subtitle: const Text('Keep it playful, never mean.'),
          ),
          const SizedBox(height: 24),
          const _SectionHeader(title: 'Privacy'),
          ListTile(
            title: const Text('Delete all data'),
            subtitle: const Text('Wipes local analytics and Wrapped history.'),
            trailing: const Icon(Icons.delete_outline),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Export my raw stats'),
            subtitle: const Text('Export JSON from local storage.'),
            trailing: const Icon(Icons.download),
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const _SectionHeader(title: 'About'),
          ListTile(
            title: const Text('Wrapper 0'),
            subtitle: const Text('Open-source vibes, offline by design.'),
            trailing: const Icon(Icons.link),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class _SwitchRow extends StatefulWidget {
  const _SwitchRow({required this.title});

  final String title;

  @override
  State<_SwitchRow> createState() => _SwitchRowState();
}

class _SwitchRowState extends State<_SwitchRow> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _value,
      onChanged: (value) => setState(() => _value = value),
      title: Text(widget.title),
      subtitle: const Text('Tracking enabled'),
    );
  }
}
