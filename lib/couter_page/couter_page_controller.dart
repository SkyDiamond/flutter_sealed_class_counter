import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sealed_class_counter/couter_page/couter_page_state.dart';

class CouterPageController extends StateNotifier<CouterPageState> {
  CouterPageController() : super(const CouterPageState());

  CounterActionResult increment() {
    state = state.copyWith(count: state.count + 1);
    return CounterUpdated(state.count);
  }

  CounterActionResult decrement() {
    if (state.count <= 0) {
      return CounterShowNegativeWarning('ค่านับติดลบไม่ได้!');
    }
    state = state.copyWith(count: state.count - 1);
    return CounterUpdated(state.count);
  }

  CounterActionResult reset() {
    state = state.copyWith(count: 0);
    return CounterUpdated(state.count);
  }
}
