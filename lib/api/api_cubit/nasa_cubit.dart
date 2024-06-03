import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/api/api_cubit/nasa_state.dart';
import 'package:nasa_api/api/repository/nasa_repository.dart';

class MarsPhotosCubit extends Cubit<NasaApiState> {
  final ApiRepository repository;

  MarsPhotosCubit(this.repository) : super(InitApiState());

  Future<void> fetchMarsPhotos() async {
    emit(LoadingApiState());
    try {
      final response = await repository.getMarsPhotos();
      emit(ResponseApiState(response));
    } catch (e) {
      emit(ErrorApiState(e.toString()));
    }
  }
}
