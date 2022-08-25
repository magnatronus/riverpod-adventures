/// Object for a Meter Consumption reading
class MeterConsumption {

  int idx;
  final double consumption;
  final DateTime intervalStart;
  final DateTime intervalEnd;

  MeterConsumption(this.consumption, this.intervalStart, this.intervalEnd,{this.idx = 0});

  static MeterConsumption fromJson(Map<String, dynamic> json){
    return MeterConsumption(
      json['consumption'], 
      DateTime.parse(json['interval_start']), 
      DateTime.parse(json['interval_end'])
    );
  }

}