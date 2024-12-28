import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteir_assig/api/api_service.dart';
import 'bloc/home/home_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products App',
      home: BlocProvider(
        create: (context) => HomeBloc(ApiService())..add(FetchProducts()),
        child: HomeScreen(),
      ),
    );
  }
}
