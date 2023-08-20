import 'package:flutter/material.dart';

import '../../models/food.dart';
import '../detailed_screen/icon_text.dart';
import '../shared_txt_widget.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  const FoodListItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(food.image.toString()), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              padding: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SharedText(
                    color: Colors.black,
                    size: 20,
                    text: food.name??'not found',
                    fontWeight: FontWeight.bold,
                  ),
                  SharedText(
                      color: Colors.grey,
                      size: 16,
                      text: food.description??'not found'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                          icon: Icons.circle,
                          color: Colors.yellow,
                          text: SharedText(
                              color: Colors.grey, size: 9, text: food.isSpecial != null && food.isSpecial==true ? 'Special ':'Normal')),
                      IconText(
                          icon: Icons.location_city_outlined,
                          color: Colors.green,
                          text: SharedText(
                              color: Colors.grey, size: 9, text: food.location ??'not found')),
                      IconText(
                          icon: Icons.time_to_leave,
                          color: Colors.red,
                          text: SharedText(
                              color: Colors.grey, size: 9, text: food.timeOfPreparation ??'not found')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
