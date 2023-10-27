class TheMatches {
  String? firstTeam;
  String? secondTeam;
  int? duration;
  String? location;

  TheMatches({this.firstTeam, this.secondTeam, this.duration, this.location});

  TheMatches copyWith({
    String? firstTeam,
    String? secondTeam,
    int? duration,
    String? location,
  }) {
    return TheMatches(
      firstTeam: firstTeam ?? this.firstTeam,
      secondTeam: secondTeam ?? this.secondTeam,
      duration: duration ?? this.duration,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'firstTeam': firstTeam,
      'secondTeam': secondTeam,
      'duration': duration,
      'location': location,
    };
    return map;
  }

  TheMatches.fromMap(Map<String, dynamic> map) {
    firstTeam = map['firstTeam'];
    secondTeam = map['secondTeam'];
    duration = map['duration'];
    location = map['location'];
  }
}

// class TheMatches {
//   String? firstTeam;
//   String? secondTeam;
//   int? duration;
//   String? location;
//   TheMatches() {}
//   TheMatches.fromMap(Map<String, dynamic> map) {
//     firstTeam = map['firstTeam'];
//     secondTeam = map['secondTeam'];
//     duration = map['duration'];
//     location = map['location'];
//   }
//   Map<String, dynamic> toMap() {
//     Map<String, dynamic> map = {
//       'firstTeam': firstTeam,
//       'secondTeam': secondTeam,
//       'duration': duration,
//       'location': location,
//     };
//     return map;
//   }
// }
