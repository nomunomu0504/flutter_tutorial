import 'package:flutter/material.dart';
import 'package:flutter_tutorial/provider/count_store/count_store_provider.dart';
import 'package:flutter_tutorial/provider/counter/counter_provider.dart';
import 'package:flutter_tutorial/view/main/main_screen.notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mainScreenNotifierProvider.notifier);
    final state = ref.read(mainScreenNotifierProvider);

    final counter = ref.watch(counterProvider);
    final savedCounts = ref.watch(counterStoreProvider);

    final counterNotifier = ref.read(counterProvider.notifier);
    final counterStoreNotifier = ref.read(counterStoreProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: savedCounts
                      .asMap()
                      .entries
                      .map(
                        (entry) => Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: entry.key % 2 == 0 ? null : Colors.black12,
                          ),
                          child: Text(
                            entry.value.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => notifier.saveCurrentStoredCounts(counterStoreNotifier.getCounts()),
            tooltip: 'Save Count',
            child: const Icon(Icons.save),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => counterStoreNotifier.saveCount(counter),
            tooltip: 'Save Count',
            child: const Icon(Icons.save_alt),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: counterNotifier.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
