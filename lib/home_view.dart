import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/api/api_cubit/nasa_cubit.dart';
import 'package:nasa_api/api/api_cubit/nasa_state.dart';
import 'package:nasa_api/api/repository/nasa_repository.dart';

class ApiHome extends StatefulWidget {
  const ApiHome({super.key});

  @override
  _ApiHomeState createState() => _ApiHomeState();
}

class _ApiHomeState extends State<ApiHome> {
  late final MarsPhotosCubit _apiCubit;

  @override
  void initState() {
    super.initState();
    _apiCubit = MarsPhotosCubit(ApiRepository());
    _apiCubit.fetchMarsPhotos();
  }

  @override
  void dispose() {
    _apiCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mars Photos'),
      ),
      body: BlocBuilder<MarsPhotosCubit, NasaApiState>(
        bloc: _apiCubit,
        builder: (context, state) {
          if (state is LoadingApiState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResponseApiState) {
            final marsPhotos = state.api;
            return ListView.builder(
              itemCount: marsPhotos.length,
              itemBuilder: (context, index) {
                final photo = marsPhotos[index];
                return ListTile(
                  leading: Image.network(photo.imgSrc),
                  title: Text(photo.camera.fullName),
                  subtitle:
                      Text('Sol: ${photo.sol}, Earth Date: ${photo.earthDate}'),
                );
              },
            );
          } else if (state is ErrorApiState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: Text('Unknown state'),
          );
        },
      ),
    );
  }
}
