


import 'package:flutter/material.dart';

class AppDataLoading extends StatelessWidget{
  const AppDataLoading({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height:8),
          Text("Loading, please wait.."),
        ],
      ),
    )
    );
  }
  
}