class Weather {
  Location? location;
  Current? current;

  Weather({
    this.location,
    this.current,
  });

  factory Weather.fromMap(Map<String, dynamic> map) => Weather(
        location: Location.fromMap(map['location']),
        current: Current.fromMap(map['current']),
      );
}

class Location {
  String? name;
  String? region;
  String? country;

  Location({
    this.name,
    this.region,
    this.country,
  });

  factory Location.fromMap(Map<String, dynamic> map) => Location(
        name: map['name'],
        region: map['region'],
        country: map['country'],
      );
}

class Current {
  double? tempC;

  Current({this.tempC});

  factory Current.fromMap(Map<String, dynamic> map) =>
      Current(tempC: map['temp_c']);
}
