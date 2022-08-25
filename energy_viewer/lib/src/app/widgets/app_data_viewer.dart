

import 'package:flutter/material.dart';

import 'app_energy_usage_panel.dart';

class AppDataViewer extends StatelessWidget{
  const AppDataViewer({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1/2 hour Energy Consumption")
      ),
      body: EnergyUsagePanel()
    );
  }

}