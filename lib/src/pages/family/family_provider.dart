import 'package:flutter_riverpod/flutter_riverpod.dart';

// part 'family_provider.g.dart';

/// StateProvider.family<T, argT>((ref, arg명)
final familyCounterStateProvider =
    StateProvider.family<int, int>((ref, initialValue) {
  ref.onDispose(() {
    print('### familyCounterStateProvider: dispose');
  });

  return initialValue;
});
