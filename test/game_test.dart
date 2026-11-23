import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bosluk_doldurma/oyun_bosluk_doldurma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(eksikHarflerConfig.title.length, 33);
    expect(eksikHarflerConfig.tagline.length, 33);
    for (final s in eksikHarflerConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(eksikHarflerConfig.gameId, eksikHarflerId);
    expect(eksikHarflerRules.gameId, eksikHarflerId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(eksikHarflerRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: eksikHarflerId, optionalMechanics: eksikHarflerRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      eksikHarflerRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(eksikHarflerRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
