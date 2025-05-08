import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sealed_class_counter/couter_page/couter_page_provider.dart';

class CouterPageSelector {
  static final count = Provider.autoDispose((ref) {
    return ref.watch(counterProvider.select((value) => value.count));
  });
}
