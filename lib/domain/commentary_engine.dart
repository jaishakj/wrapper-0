import '../data/models/models.dart';

enum SarcasmLevel { low, medium, high }

class CommentaryEngine {
  String generate({
    required SarcasmLevel level,
    required UsageAggregateInput input,
  }) {
    final templates = _templatesForLevel(level);
    final dominant = input.dominantCategory;
    final topApp = input.topAppName;
    final hoursSocial = input.socialHours.toStringAsFixed(1);
    final hoursProductive = input.productiveHours.toStringAsFixed(1);

    if (dominant == AppCategory.social) {
      return templates.social
          .replaceAll('{top_app}', topApp)
          .replaceAll('{hours_social}', hoursSocial)
          .replaceAll('{hours_productive}', hoursProductive);
    }

    if (dominant == AppCategory.video) {
      return templates.video.replaceAll('{top_app}', topApp);
    }

    if (dominant == AppCategory.music) {
      return templates.music.replaceAll('{top_app}', topApp);
    }

    return templates.general.replaceAll('{top_app}', topApp);
  }

  _Templates _templatesForLevel(SarcasmLevel level) {
    switch (level) {
      case SarcasmLevel.low:
        return _Templates(
          social:
              'You spent {hours_social} hours scrolling. Balanced with {hours_productive} hours of productivity. Respect.',
          video: 'Top app: {top_app}. Cozy cinema energy unlocked.',
          music: 'Top app: {top_app}. Soundtrack of your year, on repeat.',
          general: 'Top app: {top_app}. You and this app are basically roommates.',
        );
      case SarcasmLevel.medium:
        return _Templates(
          social:
              'You spent {hours_social} hours scrolling and {hours_productive} hours being “productive.” Iconic.',
          video: 'Top app: {top_app}. Your watchlist called. It wants a break.',
          music: 'Top app: {top_app}. At this point they should send merch.',
          general: 'Top app: {top_app}. Commitment issues? Not here.',
        );
      case SarcasmLevel.high:
        return _Templates(
          social:
              'You spent {hours_social} hours scrolling and {hours_productive} hours being “productive.” Balance? Never heard of it.',
          video:
              'Top app: {top_app}. Your couch has your schedule memorized.',
          music:
              'Top app: {top_app}. If looping was a sport, you’d go pro.',
          general:
              'Top app: {top_app}. At this point, they should put you on payroll.',
        );
    }
  }
}

class _Templates {
  const _Templates({
    required this.social,
    required this.video,
    required this.music,
    required this.general,
  });

  final String social;
  final String video;
  final String music;
  final String general;
}

class UsageAggregateInput {
  const UsageAggregateInput({
    required this.dominantCategory,
    required this.topAppName,
    required this.socialHours,
    required this.productiveHours,
  });

  final AppCategory dominantCategory;
  final String topAppName;
  final double socialHours;
  final double productiveHours;
}
