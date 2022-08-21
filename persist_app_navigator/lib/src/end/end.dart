import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/app.dart';


class EndPage extends ConsumerWidget {
  const EndPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("End"),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            ref.read(appStatusProvider.notifier).persistState(AppStatus.summary);
          }, 
          child: const Text("summary"),
        ), 
      )
    );
  }
}