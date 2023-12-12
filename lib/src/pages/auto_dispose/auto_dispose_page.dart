import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider/src/pages/auto_dispose/auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 타 provider 를 참조하는 ageProvider 감시
    final value = ref.watch(autoDisposeAgeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('autoDisposeAgeProvider'),
      ),
      body: Center(
        child: Text(
          value,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read( provider ) :  data 자체 구하기
          print(
              '### ref.read( autoDisposeCounterProvider ) : ${ref.read(autoDisposeCounterProvider)} ');
          // ref.read( provider.notifier )  :  notifier 객체( StateController<T> ) 구하기
          print(
              '### ref.read( autoDisposeCounterProvider.notifier ) : ${ref.read(autoDisposeCounterProvider.notifier)} ');
          print(
              '### ref.read( autoDisposeCounterProvider.notifier ).state + 10 : ${ref.read(autoDisposeCounterProvider.notifier).state + 10} ');

          // ref.read(autoDisposeCounterProvider.notifier).state =
          //     ref.read(autoDisposeCounterProvider.notifier).state +
          //         10; // 이전 state 기반 변경 작업

          ref
              .read(autoDisposeCounterProvider.notifier)
              .update((state) => state + 10);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
