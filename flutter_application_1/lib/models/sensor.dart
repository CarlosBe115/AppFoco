class Sensor {
  final int? id;
  final String? distance;
  final bool? isstate;

  Sensor({this.id, this.distance, this.isstate});

  /*factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      id: json['id'],
      distance: json['distance'],
      isstate: json['isstate'],
    );
  }*/
}
