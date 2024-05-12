import 'dart:convert';

import 'package:flutter_tutorial/provider/shared_preferences/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'count_store_local_repository.g.dart';

@Riverpod(keepAlive: true)
CountStoreLocalRepository countStoreLocalRepository(CountStoreLocalRepositoryRef ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return _CountStoreLocalRepository(
    sharedPreferences: sharedPreferences,
  );
}

abstract class CountStoreLocalRepository {
  void saveCurrentStoredCounts(List<int> storedCounts);
  List<int> getCurrentStoredCounts();
}

class _CountStoreLocalRepository implements CountStoreLocalRepository {
  _CountStoreLocalRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static const String _sharedPreferencesKey = 'sharedPreferences';
  final SharedPreferences _sharedPreferences;

  @override
  void saveCurrentStoredCounts(List<int> storedCounts) {
    _sharedPreferences.setString(_sharedPreferencesKey, jsonEncode(storedCounts));
  }

  @override
  List<int> getCurrentStoredCounts() {
    final storedCountsJsonString = _sharedPreferences.getString(_sharedPreferencesKey);
    return storedCountsJsonString == null ? [] : jsonDecode(storedCountsJsonString).cast<int>() as List<int>;
  }
}
