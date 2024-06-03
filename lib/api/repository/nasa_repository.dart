import 'dart:convert';

import 'package:nasa_api/api/model/nasa_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<List<NasaPhoto>> getMarsPhotos() async {
    const url =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List photos = json['photos'];
      final result = photos.map((photo) {
        return NasaPhoto.fromMap(photo);
      }).toList();
      return result;
    } else {
      throw Exception('Failed to load Mars photos');
    }
  }
}
