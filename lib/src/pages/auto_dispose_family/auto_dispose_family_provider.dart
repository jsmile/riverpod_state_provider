import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeFamilyCounterStateProvider =
    StateProvider.family.autoDispose<int, int>((ref, initialValue) {
  print('### autoDisposeFamilyCounterStateProvider: init');

  ref.onDispose(() {
    print('### autoDisposeFamilyCounterStateProvider: dispose');
  });

  return initialValue;
});
