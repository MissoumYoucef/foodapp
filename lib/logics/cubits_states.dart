import 'package:equatable/equatable.dart';

import '../models/food.dart';


abstract class CubitState extends Equatable {}

class InitialState extends CubitState {

  @override
  List<Object?> get props => [];
}


class LoadingState extends CubitState {
  @override
  List<Object?> get props => [];
}


class LoadedState extends CubitState {

  final List<Food> foods;

  LoadedState({required this.foods});
  @override
  List<Object?> get props => [foods];
}


class FoodState extends CubitState {
  final Food food;

  FoodState({required this.food});
  @override
  List<Food> get props => [food];
}

class CardState extends CubitState {
  @override
  List<Object?> get props => [];
}