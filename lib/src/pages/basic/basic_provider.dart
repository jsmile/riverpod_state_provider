import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

/// StateProvider 의 속성인 .notifier 는 StateController<T> 의 instance 를 반환한다.
/// StateController 는 StateNotifier 의 수정가능한 하위 클래스이다.
final counterProvider = StateProvider<int>((ref) {
  print('### counterProvider: init');
  ref.onDispose(() {
    print('### counterProvider: dispose');
  });
  return 0;
});

@Riverpod(keepAlive: true)
String age(AgeRef ref) {
  print('### ageProvider: init');

  ref.onDispose(() {
    print('### ageProvider: dispose');
  });

  /// 타 provider 참조 시 ref.watch() 사용
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final age = ref.watch(counterProvider);

  return 'Hi, I\'m $age years old.';
}
