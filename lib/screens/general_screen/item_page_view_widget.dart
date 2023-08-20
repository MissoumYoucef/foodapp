import 'package:flutter/material.dart';
import 'package:foodapp/models/food.dart';
import '../detailed_screen/icon_text.dart';
import '../shared_txt_widget.dart';

class PageViewItem extends StatelessWidget {
  final Food food;
  const PageViewItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          //Image

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(food.image.toString()), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),

          //food description

          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name

                  SharedText(
                      color: Colors.black, size: 25, text: food.name ?? 'notfound'),

                  const SizedBox(
                    height: 5,
                  ),

                  //Reactions stars,commments

                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.yellow,
                                )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SharedText(
                        color: Colors.grey,
                        size: 12,
                        text: food.evaluation.toString(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SharedText(
                        color: Colors.grey,
                        size: 12,
                        text: food.numberOfComments.toString(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const SharedText(
                        color: Colors.grey,
                        size: 12,
                        text: 'Comments',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //food's propreties

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                          icon: Icons.circle,
                          color: Colors.yellow,
                          text: SharedText(
                              color: Colors.grey, size: 12, text: food.isSpecial != null && food.isSpecial==true ? 'Special ':'Normal')),
                      IconText(
                          icon: Icons.location_city_outlined,
                          color: Colors.green,
                          text: SharedText(
                              color: Colors.grey, size: 12, text: food.location ??'not found')),
                      IconText(
                          icon: Icons.time_to_leave,
                          color: Colors.red,
                          text: SharedText(
                              color: Colors.grey, size: 12, text: food.timeOfPreparation ??'not found')),
                    ],
                  ),

                  //
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
