class CouterPageState {
  final int count;

  const CouterPageState({
    this.count = 0,
  });

  CouterPageState copyWith({int? count}) {
    return CouterPageState(
      count: count ?? this.count,
    );
  }
}

sealed class CounterActionResult {}

class CounterUpdated extends CounterActionResult {
  final int value;
  CounterUpdated(this.value);
}

class CounterReset extends CounterActionResult {
  final int value;
  CounterReset(this.value);
}

class CounterShowNegativeWarning extends CounterActionResult {
  final String message;
  CounterShowNegativeWarning(this.message);
}
