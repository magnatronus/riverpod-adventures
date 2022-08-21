import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/app.dart';


class SummaryPage extends ConsumerWidget {
  const SummaryPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            ref.read(appStatusProvider.notifier).persistState(AppStatus.home);
          }, 
          child: const Text("home"),
        ), 
      )
    );
  }
}