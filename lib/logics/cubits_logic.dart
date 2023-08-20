import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/add_to_chart/chart.dart';
import 'package:foodapp/screens/detailed_screen/detailed_screen.dart';
import 'package:foodapp/screens/general_screen/general_sceen.dart';

import 'cubits.dart';
import 'cubits_states.dart';


class AppCubitsLogic extends StatefulWidget {
  const AppCubitsLogic({super.key});

  @override
  State<AppCubitsLogic> createState() => _AppCubitsLogicState();
}

class _AppCubitsLogicState extends State<AppCubitsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return const GeneralScreen();
        }
        if (state is FoodState) {
          return const DetailScreen();
        }
        if (state is CardState) {
          return const ChartScreen();
        }
        return Container();
      },
    ));
  }
}