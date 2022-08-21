import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../end/end.dart';
import '../../home/home.dart';
import '../../start/start.dart';
import '../../summary/summary.dart';
import '../../track/track.dart';
import '../app.dart';



/// Our Main Material App
class App extends ConsumerWidget{
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer(
        builder: (context, ref, child){

          /// Display whichever page the status indicates
          switch( ref.watch(appStatusProvider)){
            case AppStatus.home: return const HomePage();
            case AppStatus.start: return const StartPage();
            case AppStatus.tracking: return const TrackPage();
            case AppStatus.end: return const EndPage();
            case AppStatus.summary: return const SummaryPage();
            default: 
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Initial"),
                ),
                body:  Center(
                  child: TextButton(
                    onPressed: (){
                      ref.read(appStatusProvider.notifier).state = AppStatus.home;
                    }, 
                    child: const Text("home"),
                  ),
                )
              );
          }
        },
      ),
    );
  }  
}