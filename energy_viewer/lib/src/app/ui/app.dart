

import 'package:energy_viewer/src/app/widgets/app_data_loading.dart';
import 'package:energy_viewer/src/app/widgets/app_data_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Viewer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer(
        builder: (context, ref, child){
          switch(ref.watch(meterProvider).appStatus){
            case AppStatus.initial:
            case AppStatus.loading:
              return const AppDataLoading();
            case AppStatus.loaded:
              return const AppDataViewer();  
          }
        },
      ),
    );
  }
}