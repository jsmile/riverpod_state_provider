import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider/src/pages/auto_dispose_family/auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incVal = ref.watch(autoDisposeFamilyCounterStateProvider(10));
    final decVal = ref.watch(autoDisposeFamilyCounterStateProvider(-10));

    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDisposeFamilyStateProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$incVal',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(width: 20),
                FilledButton(
                  onPressed: () {
                    ref
                        .read(
                            autoDisposeFamilyCounterStateProvider(10).notifier)
                        .update((state) => state + 10);
                  },
                  child: Text(
                    'Increment',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$decVal',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(width: 20),
                FilledButton(
                  onPressed: () {
                    ref
                        .read(
                            autoDisposeFamilyCounterStateProvider(-10).notifier)
                        .update((state) => state - 10);
                  },
                  child: Text(
                    'Decrement',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
