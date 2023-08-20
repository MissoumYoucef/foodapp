import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/logics/cubits.dart';
import 'package:foodapp/logics/cubits_states.dart';
import 'package:foodapp/screens/detailed_screen/icon_text.dart';
import 'package:foodapp/screens/detailed_screen/top_icon.dart';
import 'package:foodapp/screens/shared_txt_widget.dart';

import '../../models/food.dart';

class DetailScreen extends StatefulWidget {
  
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubits, CubitState>(
          builder: (context, state) {
            if (state is FoodState) {
              Food food = state.props[0];
              return Stack(
                children: [
                  //food's image
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Image.network(
                      food.image.toString(),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),

                  //return button

                  const Positioned(
                    right: 15,
                    top: 20,
                    child: TopIcon(icon: Icons.add),
                  ),

                  //add to button

                  const Positioned(
                    left: 15,
                    top: 20,
                    child: TopIcon(icon: Icons.arrow_back),
                  ),

                  //food's description

                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //food's name

                            SharedText(
                              color: Colors.black,
                              size: 30,
                              text: food.name ?? 'not found',
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            //Reactions stars,commments

                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                      5,
                                      (index) => const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.yellow,
                                          )),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SharedText(
                                  color: Colors.grey,
                                  size: 16,
                                  text: food.evaluation.toString(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SharedText(
                                  color: Colors.grey,
                                  size: 16,
                                  text: food.numberOfComments.toString(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SharedText(
                                  color: Colors.grey,
                                  size: 16,
                                  text: 'comments',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            //food's propreties

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconText(
                                    icon: Icons.circle,
                                    color: Colors.yellow,
                                    text: SharedText(
                                        color: Colors.grey,
                                        size: 15,
                                        text: food.isSpecial != null
                                            ? food.isSpecial == true
                                                ? 'Special'
                                                : 'Normal'
                                            : 'not found')),
                                IconText(
                                    icon: Icons.location_city_outlined,
                                    color: Colors.green,
                                    text: SharedText(
                                        color: Colors.grey,
                                        size: 15,
                                        text: food.location ?? 'not found')),
                                IconText(
                                    icon: Icons.time_to_leave,
                                    color: Colors.red,
                                    text: SharedText(
                                        color: Colors.grey,
                                        size: 15,
                                        text:
                                            food.timeOfPreparation.toString())),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            //food's Intruduce

                            const SharedText(
                              color: Colors.black,
                              size: 20,
                              text: 'Introduce',
                              fontWeight: FontWeight.bold,
                            ),

                            SharedText(
                              color: Colors.grey,
                              size: 15,
                              text: food.description ?? 'not found',
                            ),

                            InkWell(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  SharedText(
                                    color: Colors.green,
                                    size: 17,
                                    text: 'show more',
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //
                ],
              );
            }
            return Container();
          },
        ),

        // bottomNavigationBar

        bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    const Text('0'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<AppCubits>(context).addToChart();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: const SharedText(
                    color: Colors.white,
                    size: 20,
                    text: '\$ | Add to Cart',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
