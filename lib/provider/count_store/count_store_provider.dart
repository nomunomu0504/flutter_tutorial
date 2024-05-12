import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_store_provider.g.dart';

@Riverpod(keepAlive: true)
class CounterStore extends _$CounterStore {
  @override
  List<int> build() => [];

  void saveCount(int count) => state = [count, ...state];
}
