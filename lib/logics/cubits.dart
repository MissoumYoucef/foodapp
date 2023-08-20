import 'package:bloc/bloc.dart';
import '../models/food.dart';
import '../reposotories/dataservices.dart';
import 'cubits_states.dart';

class AppCubits extends Cubit<CubitState> {
  final DataServices dataServices;

  AppCubits(this.dataServices) : super(InitialState()) {
    fetchFoods();
  }

  void fetchFoods() async {
    try {
      emit(LoadingState());

      List<Food> foods = await dataServices.getInfo();

      emit(LoadedState(foods: foods));
    } catch (e) {
      // Handle error state if needed
    }
  }

  void fetchdetailedFood(Food food) {
    emit(FoodState(food: food));
  }

  void addToChart() {
    emit(CardState());
  }
}
