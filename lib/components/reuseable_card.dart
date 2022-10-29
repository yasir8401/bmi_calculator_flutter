import 'package:flutter/material.dart';

class ResuseableCard extends StatelessWidget {
  ResuseableCard(@required this.colour, this.cardChild, this.captureGesture);

  final Color colour;
  final Widget cardChild;

  final Function captureGesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: captureGesture(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
