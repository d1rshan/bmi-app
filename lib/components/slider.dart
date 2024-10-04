import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final double minVal;
  final double maxVal;
  final double val;
  final Function(double)? onChange;

  const SliderWidget(
      {required this.minVal,
      required this.maxVal,
      required this.val,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Slider(
      thumbColor: Colors.black,
      activeColor: Colors.green,
      min: minVal,
      max: maxVal,
      value: val,
      onChanged: onChange,
    );
  }
}
