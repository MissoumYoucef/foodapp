import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/reposotories/dataservices.dart';

import 'logics/cubits.dart';
import 'logics/cubits_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AppCubits(DataServices()),
        child: const AppCubitsLogic(),
      ),
    );
  }
}



