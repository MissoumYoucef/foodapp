import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/logics/cubits.dart';
import 'package:foodapp/logics/cubits_states.dart';
import 'package:foodapp/models/food.dart';
import 'package:foodapp/screens/general_screen/item_listview.dart';
import 'package:foodapp/screens/shared_txt_widget.dart';

import 'item_page_view_widget.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  List images = ['images/b.jpg', 'images/a.jpg', 'images/c.jpg'];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1

      body: SafeArea(
        child: BlocBuilder<AppCubits, CubitState>(
          builder: (context, state) {
            if (state is LoadedState) {
              List<Food> foods = state.foods;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            SharedText(
                              color: Colors.green,
                              size: 20,
                              text: 'Algiers',
                              fontWeight: FontWeight.w600,
                            ),
                            Row(
                              children: [
                                SharedText(
                                    color: Colors.grey,
                                    size: 15,
                                    text: 'Babzwar'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green),
                          child: const Icon(Icons.search),
                        )
                      ],
                    ),
                  ),

                  //2

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: double.infinity,
                    child: PageView(
                      controller: pageController,
                      children: List.generate(
                          foods.length,
                          (index) => InkWell(
                              onTap: () => BlocProvider.of<AppCubits>(context)
                                  .fetchdetailedFood(foods[index]),
                              child: PageViewItem(food: foods[index]))),
                    ),
                  ),

                  //3

                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: SharedText(
                        color: Colors.black, size: 25, text: 'Popular'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //4

                  Expanded(
                    child: ListView.builder(
                      itemCount: foods.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context)
                              .fetchdetailedFood(foods[index]);
                        },
                        child: FoodListItem(
                          food: foods[index],
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
