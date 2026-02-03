import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _CategoryRow(
            title: 'Music',
            subtitle: 'Listening patterns and top apps',
            icon: Icons.headphones,
            onTap: () => context.go('/category/music'),
          ),
          _CategoryRow(
            title: 'Photos',
            subtitle: 'Camera activity and photo growth',
            icon: Icons.camera_alt,
            onTap: () => context.go('/category/photos'),
          ),
          _CategoryRow(
            title: 'Social',
            subtitle: 'Scroll time and content creation',
            icon: Icons.flash_on,
            onTap: () => context.go('/category/social'),
          ),
          _CategoryRow(
            title: 'Messaging',
            subtitle: 'Messages and calls, metadata only',
            icon: Icons.chat_bubble,
            onTap: () => context.go('/category/messaging'),
          ),
          _CategoryRow(
            title: 'Video',
            subtitle: 'Watch time and binge streaks',
            icon: Icons.play_circle,
            onTap: () => context.go('/category/video'),
          ),
        ],
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
