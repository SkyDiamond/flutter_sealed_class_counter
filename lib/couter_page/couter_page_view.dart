import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sealed_class_counter/couter_page/couter_page_provider.dart';
import 'package:flutter_sealed_class_counter/couter_page/couter_page_selector.dart';
import 'package:flutter_sealed_class_counter/couter_page/couter_page_state.dart';

class CouterPageView extends ConsumerStatefulWidget {
  const CouterPageView({super.key});

  @override
  ConsumerState<CouterPageView> createState() => _CouterPageViewState();
}

class _CouterPageViewState extends ConsumerState<CouterPageView> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handle(CounterActionResult result) async {
    switch (result) {
      case CounterUpdated():
        break;
      case CounterReset():
        break;
      case CounterShowNegativeWarning():
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(result.message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(CouterPageSelector.count);
    final controller = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Sealed Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ค่านับปัจจุบัน',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _handle(controller.increment()),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _handle(controller.decrement()),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handle(controller.reset()),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
