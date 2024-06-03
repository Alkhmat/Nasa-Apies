import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/api/api_cubit/nasa_cubit.dart';
import 'package:nasa_api/api/repository/nasa_repository.dart';
import 'package:nasa_api/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarsPhotosCubit(
        ApiRepository(),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ApiHome(),
      ),
    );
  }
}
