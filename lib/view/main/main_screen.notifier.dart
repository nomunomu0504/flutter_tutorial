import 'package:flutter_tutorial/repository/local/count_store/count_store_local_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_screen.notifier.g.dart';

@riverpod
class MainScreenNotifier extends _$MainScreenNotifier {
  @override
  void build() => _init();

  CountStoreLocalRepository get _countStoreLocalRepository => ref.read(countStoreLocalRepositoryProvider);

  void _init() {
    // nothings
  }

  void saveCurrentStoredCounts(List<int> storedCounts) {
    return _countStoreLocalRepository.saveCurrentStoredCounts(storedCounts);
  }

  List<int> getCurrentStoredCounts() {
    return _countStoreLocalRepository.getCurrentStoredCounts();
  }
}
