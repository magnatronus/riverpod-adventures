
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../app.dart';

class AppDataColumn extends StatelessWidget{
  final MeterConsumption reading;
  final DateFormat df = DateFormat("HH:mm");
  AppDataColumn({Key? key, required this.reading}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        final currentPage = ref.watch(meterProvider).currentPage;
        return Column(  
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(2),
              height: reading.consumption * 500,
              width: 40,
              color: (currentPage == reading.idx) ? Colors.green : Colors.blue,
              child: Text("${reading.consumption}",  textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption),
            ),
            Text(time(reading.intervalStart), textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption)
          ],
        );
      },
    );

    
  }

  /// Format time for the column display
  String time( DateTime time){
    return df.format(time.toLocal());
  }  
  
}