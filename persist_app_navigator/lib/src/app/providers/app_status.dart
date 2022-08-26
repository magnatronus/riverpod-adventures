

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The main app statuses (aka screens)
enum AppStatus {initial, home, start, tracking, end, summary}


/// This is used to persist the current App state to Shared Prefs
/// so it can be reloaded when the app is restarted
class AppStatePersistNotifier extends StateNotifier<AppStatus> {

  late final SharedPreferences _prefs;

  AppStatePersistNotifier() : super(AppStatus.initial){
    _init();
  }

  /// Load any initial persisted value OR set to initial[0]
  Future <void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    int status = _prefs.getInt("app.status") ?? 0;
    state = AppStatus.values[status];
  }

  /// Set the [status] and allow it to be persisted.
  /// By default [persist] is true
  void setState(AppStatus status, {bool persist = true}){
    if(persist) {
      _prefs.setInt("app.status", status.index);
    }
    state = status;
  }
  
}

// Now create the AppStatus Provider
final appStatusProvider = StateNotifierProvider<AppStatePersistNotifier, AppStatus>((ref) {
  return AppStatePersistNotifier();
});
