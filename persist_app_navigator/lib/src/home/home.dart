import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/app.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            ref.read(appStatusProvider.notifier).persistState(AppStatus.start);
          }, 
          child: const Text("start"),
        ), 
      )
    );
  }
}