class NasaPhoto {
  final int id;
  final int sol;
  final NasaCamera camera;
  final String imgSrc;
  final String earthDate;
  final NasaRover rover;

  NasaPhoto({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  factory NasaPhoto.fromMap(Map<String, dynamic> map) {
    return NasaPhoto(
      id: map['id'] as int,
      sol: map['sol'] as int,
      camera: NasaCamera.fromMap(map['camera']),
      imgSrc: map['img_src'] as String,
      earthDate: map['earth_date'] as String,
      rover: NasaRover.fromMap(map['rover']),
    );
  }
}

class NasaCamera {
  final int id;
  final String name;
  final String fullName;

  NasaCamera({
    required this.id,
    required this.name,
    required this.fullName,
  });

  factory NasaCamera.fromMap(Map<String, dynamic> map) {
    return NasaCamera(
      id: map['id'] as int,
      name: map['name'] as String,
      fullName: map['full_name'] as String,
    );
  }
}

class NasaRover {
  final int id;
  final String name;
  final String landingDate;
  final String launchDate;
  final String status;
  final int maxSol;
  final String maxDate;
  final int totalPhotos;

  NasaRover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
  });

  factory NasaRover.fromMap(Map<String, dynamic> map) {
    return NasaRover(
      id: map['id'] as int,
      name: map['name'] as String,
      landingDate: map['landing_date'] as String,
      launchDate: map['launch_date'] as String,
      status: map['status'] as String,
      maxSol: map['max_sol'] as int,
      maxDate: map['max_date'] as String,
      totalPhotos: map['total_photos'] as int,
    );
  }
}
