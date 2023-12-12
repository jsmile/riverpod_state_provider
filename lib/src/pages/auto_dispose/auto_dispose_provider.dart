import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auto_dispose_provider.g.dart';

/// A provider 가 B provider 를 참조하고자 할 때에는
/// A provider 는 참조하는 B provider 을 따라 모두 autoDispose 또는 non autoDispose 로 일치시켜야 하고,
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
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final age = ref.watch(autoDisposeCounterProvider);

  return 'Hi, I\'m $age years old.';
}
