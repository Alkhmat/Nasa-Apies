import 'package:nasa_api/api/model/nasa_model.dart';

sealed class NasaApiState {}

class InitApiState extends NasaApiState {}

class ErrorApiState extends NasaApiState {
  final String error;
  ErrorApiState(this.error);
}

class LoadingApiState extends NasaApiState {}

class ResponseApiState extends NasaApiState {
  final List<NasaPhoto> api;
  ResponseApiState(this.api);
}
