


import 'package:energy_viewer/src/app/widgets/app_data_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app.dart';


class EnergyUsagePanel extends ConsumerWidget{

  final PageController controller = PageController(viewportFraction: 0.15);
  
  EnergyUsagePanel({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readings = ref.read(meterProvider.notifier).readings;
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: (int value){
              ref.read(meterProvider.notifier).setPage(value);
            },
            children: readings.map((reading){
              return AppDataColumn(reading: reading);
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Electricity cost so far: £${ref.watch(meterProvider).currentCost.toStringAsFixed(2)}")
        )
      ],
    );
  }

}