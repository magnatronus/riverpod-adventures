import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/app.dart';


class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start"),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            ref.read(appStatusProvider.notifier).setState(AppStatus.tracking, persist: false);
          }, 
          child: const Text("tracking"),
        ), 
      )
    );
  }
}