import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auto_dispose_provider.g.dart';

/// A provider 가 B provider 를 참조하고자 할 때에는
/// 참조대상 B provider 가 autoDispose 이면 참조하는 A provider 도 autoDispose 로 일치시켜야 하고,
/// 안그러면 오류 발생 : The argument type 'AutoDisposeStateProvider<int>' can't be assigned to the parameter type 'AlwaysAliveProviderListenable<dynamic>'.

final autoDisposeCounterProvider = StateProvider.autoDispose<int>((ref) {
  print('### autoDisposeCounterProvider: init');
  ref.onDispose(() {
    print('### autoDisposeCounterProvider: dispose');
  });
  return 0;
});

@Riverpod(keepAlive: false)
String autoDisposeAge(AutoDisposeAgeRef ref) {
  print('### autoDisposeAgeProvider: init');

  ref.onDispose(() {
    print('### autoDisposeAgeProvider: dispose');
  });

  /// 타 provider 참조 시 ref.watch() 사용
  /// 타 provider 의 satae 가 변경되면 자신도 rebuild 됨.
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final age = ref.watch(autoDisposeCounterProvider);

  return 'Hi, I\'m $age years old.';
}
