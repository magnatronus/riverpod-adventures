

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main app statuses (aka screens)
enum AppStatus {initial, home, start, tracking, end, summary}

// create our state provider and initialise its value
final appStatusProvider = StateProvider<AppStatus>(
  (ref) => AppStatus.initial,
);