import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // // 'setState() ... called during build' error 해결을 위한
    // // ref.listen<T>( T, ( previous, next ) { }) 을 사용
    // ref.listen<int>(counterProvider, (previous, next) {
    //   if (next == 3) {
    //     showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text('Value is $next'),
    //         );
    //       },
    //     );
    //   }
    // });

    // 타 provider 를 참조하는 ageProvider 감시
    final value = ref.watch(ageProvider);

    // final value = ref.watch(counterProvider);
    //
    // 'setState() ... called during build' error
    // if (value == 3) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Value is $value'),
    //       );
    //     },
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
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
              '### ref.read( counterProvider ) : ${ref.read(counterProvider)} ');
          // ref.read( provider.notifier )  :  notifier 객체( StateController<T> ) 구하기
          print(
              '### ref.read( counterProvider.notifier ) : ${ref.read(counterProvider.notifier)} ');
          ref
              .read(counterProvider.notifier)
              .state++; // state 는 T의 getter/setter 이다.
          // StateProvider 의 state 직접 수정 가능
          //햣 ref.read(counterProvider.notifier).state =
          //     ref.read(counterProvider.notifier).state + 10;
          // ref.read(counterProvider.notifier).state = 10;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
