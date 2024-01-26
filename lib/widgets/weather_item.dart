import 'package:flutter/material.dart';
import 'package:weather_app/utils/dimension.dart';

class weatherItem extends StatelessWidget {
  const weatherItem({
    Key? key,
    required this.value, required this.text, required this.unit, required this.imageUrl,
  }) : super(key: key);

  final int value;
  final String text;
  final String unit;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Dimension.init(context);
    return Column(
      children: [
        Text(text, style: const TextStyle(
          color: Colors.black54,
        ),),
         SizedBox(
          height: Dimension.height8,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          height: Dimension.height60,
          width: Dimension.width60,
          decoration: const BoxDecoration(
            color: Color(0xffE0E8FB),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Image.asset(imageUrl),
        ),
         SizedBox(
          height: Dimension.height8,
        ),
        Text(value.toString() + unit, style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),)
      ],
    );
  }
}