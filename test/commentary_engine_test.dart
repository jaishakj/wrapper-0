import 'package:flutter_test/flutter_test.dart';
import 'package:wrapper_0/domain/commentary_engine.dart';
import 'package:wrapper_0/data/models/app_info.dart';

void main() {
  test('commentary engine selects social template for social dominance', () {
    final engine = CommentaryEngine();
    final output = engine.generate(
      level: SarcasmLevel.medium,
      input: const UsageAggregateInput(
        dominantCategory: AppCategory.social,
        topAppName: 'Instagram',
        socialHours: 10,
        productiveHours: 2,
      ),
    );

    expect(output, contains('scrolling'));
    expect(output, contains('Instagram'));
  });

  test('commentary engine adapts intensity', () {
    final engine = CommentaryEngine();
    final low = engine.generate(
      level: SarcasmLevel.low,
      input: const UsageAggregateInput(
        dominantCategory: AppCategory.music,
        topAppName: 'Spotify',
        socialHours: 2,
        productiveHours: 5,
      ),
    );
    final high = engine.generate(
      level: SarcasmLevel.high,
      input: const UsageAggregateInput(
        dominantCategory: AppCategory.music,
        topAppName: 'Spotify',
        socialHours: 2,
        productiveHours: 5,
      ),
    );

    expect(low, isNot(equals(high)));
  });
}
