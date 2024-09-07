import 'package:co2_tracking/constant/colors.dart';
import 'package:flutter/material.dart';

class PropBoxes extends StatelessWidget {
  const PropBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Spacer(),
            PropBox(colorIndex: 0, text: "CO"),
            Spacer(),
            PropBox(colorIndex: 1, text: "OC"),
            Spacer(),
            PropBox(colorIndex: 2, text: "PU"),
            Spacer(),
            PropBox(colorIndex: 3, text: "SU"),
            Spacer(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Spacer(),
            PropBox(colorIndex: 4, text: "BT"),
            Spacer(),
            PropBox(colorIndex: 5, text: "EM"),
            Spacer(),
            PropBox(colorIndex: 6, text: "HE"),
            Spacer(),
          ],
        ),
      ],
    );
  }
}


class PropBox extends StatelessWidget {
  final int colorIndex;
  final String text;

  const PropBox({
    Key? key,
    required this.colorIndex,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: colorList[colorIndex],
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
