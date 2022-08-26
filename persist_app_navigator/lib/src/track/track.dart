import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/app.dart';


class TrackPage extends ConsumerWidget {
  const TrackPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            ref.read(appStatusProvider.notifier).setState(AppStatus.end);
          }, 
          child: const Text("end"),
        ), 
      )
    );
  }
}