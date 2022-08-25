

import 'dart:convert';

import 'package:energy_viewer/src/app/app.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

enum AppStatus {initial, loading, loaded}

/// For this example our state is an object rather than just a simple enum
/// and as it is derived from Equatable so its state is final
class MeterStatus extends Equatable{

  final AppStatus appStatus;
  final int currentPage;
  final double currentCost;

  const MeterStatus({this.appStatus = AppStatus.initial, this.currentPage = 0, this.currentCost = 0});
  
  MeterStatus copyWith({
    AppStatus? appStatus,
    int? currentPage,
    double? currentCost
  }){
    return MeterStatus(
      appStatus: appStatus ?? this.appStatus,
      currentPage: currentPage ?? this.currentPage,
      currentCost: currentCost ?? this.currentCost,
    );
  }

  @override
  List<Object?> get props => [appStatus, currentPage, currentCost];

}

/// This is our MeterNotifier
class MeterNotifier extends StateNotifier<MeterStatus> {

  List <MeterConsumption> readings = [];

  // Alter these to affect cost calculation
  final double standingCharge = 0.47788;
  final double kilowattHour = 0.2829;

  MeterNotifier(super.state){
    _init();
  }

  /// Housekeeping - probably a far better way to do this , but..
  List<MeterConsumption> _tidyImport(List<MeterConsumption> data){
    data.sort((a,b) => a.intervalStart.compareTo(b.intervalStart));
    int idx = -1;
    return data.map((element){
      idx++;
      element.idx = idx;
      return element;
    }).toList();
  }


  /// Kick the tyres and light the fires
  /// normally the data would come from an API call but here we load a json file from the assets dir
  void _init() async{
    state = state.copyWith(appStatus: AppStatus.loading);
    final data = await rootBundle.loadString("assets/readings.json");
    final results = jsonDecode(data)['results'].map<MeterConsumption>((json) => MeterConsumption.fromJson(json)).toList();
    readings = _tidyImport(results);

    // dont forget to calc the initial costs for reading 0
    final initialCost = (readings[0].consumption * kilowattHour) + standingCharge;
    state = state.copyWith(
      appStatus: AppStatus.loaded,
      currentCost: initialCost
    );
  }

  /// Update the current PageView [page]
  /// and calc the current cost
  void setPage(int page){
    final sample = readings.getRange(0, page+1);
    double usedSoFar = 0.0;
    for(final entry in sample){
      usedSoFar += entry.consumption;
    }
    state = state.copyWith(
      currentCost: (usedSoFar * kilowattHour) + standingCharge,
      currentPage: page
    );
  }

}


/// Create our provider
final meterProvider = StateNotifierProvider<MeterNotifier, MeterStatus>(
  (ref) => MeterNotifier(const MeterStatus())
);