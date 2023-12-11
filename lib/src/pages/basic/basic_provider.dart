import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateProvider 의 속성인 .notifier 는 StateController<T> 의 instance 를 반환한다.
/// StateController 는 StateNotifier 의 수정가능한 하위 클래스이다.
final counterProvider = StateProvider<int>((ref) {
  print('### counterProvider: init');
  ref.onDispose(() {
    print('### counterProvider: dispose');
  });
  return 0;
});
