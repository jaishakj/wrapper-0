import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;
  bool _music = true;
  bool _photos = true;
  bool _social = true;
  bool _messaging = true;
  bool _video = true;
  double _sarcasm = 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) => setState(() => _index = value),
                children: [
                  _OnboardingPage(
                    title: 'Your Phone, Wrapped',
                    description:
                        'See your year like Spotify Wrapped, but for everything.',
                  ),
                  _OnboardingPage(
                    title: 'Private by Default',
                    description:
                        'All analytics stay on your device. No accounts, no cloud, no tracking.',
                  ),
                  _OnboardingPage(
                    title: 'Choose what to track',
                    description:
                        'Toggle the categories you want. You can change this later.',
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _ToggleChip(
                          label: 'Music',
                          value: _music,
                          onChanged: (value) =>
                              setState(() => _music = value),
                        ),
                        _ToggleChip(
                          label: 'Photos',
                          value: _photos,
                          onChanged: (value) =>
                              setState(() => _photos = value),
                        ),
                        _ToggleChip(
                          label: 'Social',
                          value: _social,
                          onChanged: (value) =>
                              setState(() => _social = value),
                        ),
                        _ToggleChip(
                          label: 'Messaging',
                          value: _messaging,
                          onChanged: (value) =>
                              setState(() => _messaging = value),
                        ),
                        _ToggleChip(
                          label: 'Video',
                          value: _video,
                          onChanged: (value) =>
                              setState(() => _video = value),
                        ),
                      ],
                    ),
                  ),
                  _OnboardingPage(
                    title: 'Sarcasm intensity',
                    description:
                        'Pick your flavor. We keep it playful, never mean.',
                    child: Column(
                      children: [
                        Slider(
                          value: _sarcasm,
                          min: 0,
                          max: 2,
                          divisions: 2,
                          label: _sarcasmLabel(_sarcasm),
                          onChanged: (value) =>
                              setState(() => _sarcasm = value),
                        ),
                        Text(
                          _sarcasmLabel(_sarcasm),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('${_index + 1}/4'),
                  const Spacer(),
                  FilledButton(
                    onPressed: () {
                      if (_index < 3) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      } else {
                        context.go('/');
                      }
                    },
                    child: Text(_index < 3 ? 'Next' : 'Start'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _sarcasmLabel(double value) {
    if (value < 0.5) return 'Low';
    if (value < 1.5) return 'Medium';
    return 'Unhinged';
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.title,
    required this.description,
    this.child,
  });

  final String title;
  final String description;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (child != null) ...[
            const SizedBox(height: 24),
            child!,
          ],
          const Spacer(),
        ],
      ),
    );
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: value,
      label: Text(label),
      onSelected: onChanged,
    );
  }
}
